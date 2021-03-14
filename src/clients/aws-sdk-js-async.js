process.env.AWS_NODEJS_CONNECTION_REUSE_ENABLED = '1';

const { Endpoint } = require('aws-sdk');
const S3 = require('aws-sdk/clients/s3');
const fs = require('fs');

async function runUpload() {
  const ctx = JSON.parse(process.argv[process.argv.length - 1]);
  const client = new S3({ endpoint: new Endpoint(ctx.endpoint) });

  for (const file of ctx.files) {
    const uploadCtx = {
      Bucket: 'Target',
      Key: 'Key',
      Body: fs.createReadStream(file),
    };
    await client.upload(uploadCtx).promise();
  }
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
