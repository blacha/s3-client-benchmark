const { Logger } = require('./log');
const cluster = require('cluster');

const clusterWorkerSize = Number(process.env.WORKER_COUNT || 1);

function startCluster(start, workerCount = clusterWorkerSize) {
  Logger.info({ workers: workerCount, isMaster: cluster.isMaster, isWorker: cluster.isWorker }, 'ClusterStart');

  if (cluster.isMaster && workerCount > 1) {
    for (let i = 0; i < workerCount; i++) cluster.fork();
    cluster.on('exit', (worker) => console.log('Worker', worker.id, ' has exited.'));
  } else {
    start();
  }
}

module.exports = { startCluster };
