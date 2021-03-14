process.env.AWS_NODEJS_CONNECTION_REUSE_ENABLED = '1';

const { Endpoint } = require('aws-sdk');
const S3 = require('aws-sdk/clients/s3');
const fs = require('fs');

async function runUpload() {
  const ctx = JSON.parse(process.argv[process.argv.length - 1]);
  const client = new S3({ endpoint: new Endpoint(ctx.endpoint) });

  await Promise.all(
    ctx.files.map((filePath) => {
      const uploadCtx = {
        Bucket: 'Target',
        Key: 'Key',
        Body: fs.createReadStream(filePath),
      };
      return client.upload(uploadCtx).promise();
    }),
  );
}

/**
 * @typedef {Object} UploadContext
 * @property {string} Bucket
 * @property {string} Key
 * @property {string[]} files
 * @property {string} endpoint
 *
 *
 * @param {UploadContext} ctx
 * @returns {Promise<void>} unknown
 */
function toCommand(ctx) {
  return [`node`, 'src/clients/aws-sdk-js.js', JSON.stringify(ctx)];
}

module.exports = {
  name: 'aws-sdk:js',
  toCommand,
};

if (require.main === module) {
  runUpload();
}
