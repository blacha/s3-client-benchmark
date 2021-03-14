const { startCluster } = require('./cluster');
const { start } = require('./s3.server');

startCluster(start);
