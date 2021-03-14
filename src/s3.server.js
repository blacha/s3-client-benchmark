const fastify = require('fastify')({ logger: false });
const { Logger } = require('./log');
const { ulid } = require('ulid');
const { V } = require('./vdom');
const { createHash } = require('crypto');

function handleMedia(req, payload, done) {
  let count = 0;
  payload.on('data', (chunk) => (count += chunk.length));
  payload.on('end', () => done(null, count));
}
fastify.addContentTypeParser('*', handleMedia);

fastify.get('/', (req) => {
  return V('ListAllMyBucketsResult', [
    V('Buckets', [V('Bucket', [V('CreationDate', new Date().toISOString()), V('Name', 'BucketName')])]),
    V('Owner', [V('DisplayName', 'string'), V('ID', 'name')]),
  ]).toXml();
});

fastify.post('/:bucket/:key', (req, res) => {
  if (req.query.uploads == null) return V('Body').toXml();
  const uploadId = ulid().toLowerCase();

  res.header('content-type', 'application/xml');
  return V('InitiateMultipartUploadResult', [
    V('Bucket', req.params.bucket),
    V('Key', req.params.key),
    V('UploadId', uploadId),
  ]).toXml();
});

function logAllEndpoint(req, res) {
  Logger.info({ url: req.url }, req.method);
  res.header(
    'etag',
    createHash('sha256')
      .update(req.method + req.url)
      .digest('base64'),
  );
  return V('body').toXml();
}
fastify.head('*', logAllEndpoint);
fastify.get('*', logAllEndpoint);
fastify.post('*', logAllEndpoint);
fastify.put('*', logAllEndpoint);
fastify.delete('*', logAllEndpoint);

const start = async () => {
  try {
    await fastify.listen(8080, '0.0.0.0');
  } catch (err) {
    Logger.error(err);
    process.exit(1);
  }
};

module.exports = { start };
