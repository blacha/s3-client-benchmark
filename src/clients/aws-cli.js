module.exports = {
  name: 'aws-cli',
  toCommand(ctx) {
    return ctx.files.map((filePath) => ['aws', 's3', 'cp', '--endpoint', ctx.endpoint, filePath, `s3://bucket/key`]);
  },
};
