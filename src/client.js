const fs = require('fs');
const { Logger } = require('./log');
const { ulid } = require('ulid');
const path = require('path');
const { spawn } = require('child_process');

const clientAwsSdkJs = require('./clients/aws-sdk-js');
const clientS5Cmd = require('./clients/s5-cmd');
const clientAwsCli = require('./clients/aws-cli');

const Clients = [
  //
  clientAwsCli,
  clientAwsSdkJs,
  clientS5Cmd,
];
const TestFiles = [
  //
  'data/256',
  // 'data/512',
  // 'data/2048',
];

const isMarkDown = true;
function runProcess(id, cmd, log) {
  log.debug({ cmd: cmd[0], args: cmd.slice(1) }, 'Spawn');

  const startTime = Date.now();
  const child = spawn(cmd[0], cmd.slice(1));

  const stdout = [];
  const stderr = [];

  child.stdout.on('data', (chunk) => stdout.push(chunk));
  child.stderr.on('data', (chunk) => stderr.push(chunk));

  return new Promise((resolve) => {
    child.on('exit', (exitCode) => {
      resolve({ id, exitCode, stdout: stdout.join(''), stderr: stderr.join(''), duration: Date.now() - startTime });
    });
  });
}

class TestStat {
  constructor(fileCount, fileSizeTotal, client, threads) {
    this.fileCount = fileCount;
    this.fileSizeTotal = fileSizeTotal;
    this.client = client;
    this.threads = threads;
    this.startTime = Date.now();
  }

  get fileSize() {
    return this.fileSizeTotal / this.fileCount;
  }

  get totalSent() {
    return this.fileSizeTotal * this.threads;
  }

  get speed() {
    return Number((this.totalSent / (this.duration / 1000)).toFixed(2));
  }

  done() {
    this.endTime = Date.now();
    this.duration = this.endTime - this.startTime;
  }
}

const Threads = [1, 2, 4];

async function main() {
  const targetServer = process.argv[process.argv.length - 1];
  if (!targetServer.startsWith('http')) {
    Logger.fatal('Missing target server, "node src/client.js http://foo:8080"');
    return;
  }
  const results = [];
  for (const file of TestFiles) {
    const files = (await fs.promises.readdir(file)).map((c) => path.join(file, c));

    let totalSizeMb = 0;
    for (const f of files) {
      stat = fs.statSync(f);
      totalSizeMb += stat.size / 1024 / 1024;
    }
    for (const threads of Threads) {
      for (const client of Clients) {
        Logger.info({ client: client.name, threads }, 'Starting');

        const cmd = client.toCommand({ files: files, endpoint: targetServer });

        const test = new TestStat(files.length, totalSizeMb, client, threads);
        const startTime = Date.now();
        let totalSizeSent = 0;
        const todo = [];
        for (let i = 0; i < threads; i++) {
          totalSizeSent += totalSizeMb;
          if (Array.isArray(cmd[0])) {
            todo.push(
              Promise.resolve().then(async () => {
                for (let j = 0; j < cmd.length; j++) {
                  const child = cmd[j];
                  const task = await runProcess(i, child, Logger.child({ client: client.name, child: i, subTask: j }));
                  if (task.exitCode > 0) {
                    Logger.warn({ exitCode: task.exitCode, taskId: task.id }, 'Failed to run');
                  }
                }

                return { exitCode: 0, id: i };
              }),
            );
          } else {
            todo.push(runProcess(i, cmd, Logger.child({ client: client.name, child: i })));
          }
        }

        const tasks = await Promise.all(todo);
        for (const task of tasks) {
          if (task.exitCode > 0) {
            Logger.warn({ exitCode: task.exitCode, taskId: task.id }, 'Failed to run');
          }
        }
        test.done();
        results.push(test);
        const duration = Date.now() - startTime;
        Logger.info(
          {
            client: client.name,
            sent: { Mb: test.totalSent, Mbs: test.speed },
            threads: threads,
            duration,
          },
          'Done',
        );
      }
    }
  }

  const sep = isMarkDown ? '|' : '\t';
  const Header = [
    'Client',
    'Threads',
    'Files',
    'FileSize (MB)',
    'TotalTransferred (MB)',
    'Duration (s)',
    'Speed (MB/s)',
  ];
  console.log(Header.join(sep));
  if (isMarkDown) {
    console.log(Header.map((c) => '-').join('|'));
  }
  for (const test of results) {
    console.log(
      [
        test.client.name,
        test.threads,
        test.fileCount * test.threads,
        test.fileSize,
        test.totalSent,
        test.duration / 1000,
        test.speed,
      ].join(sep),
    );
  }
}

main().catch((e) => {
  Logger.fatal(e, e.message);
});
