module.exports = {
  name: 's5-cmd',
  toCommand(ctx) {
    return ctx.files.map((filePath) => ['s5cmd', '--endpoint-url', ctx.endpoint, 'cp', filePath, `s3://bucket/key`]);
  },
};
