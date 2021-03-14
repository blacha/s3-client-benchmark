const { PrettyTransform } = require('pretty-json-log');
const pino = require('pino');

const Logger = process.stdout.isTTY ? pino(PrettyTransform.stream()) : pino();
Logger.level = 'debug';

module.exports = { Logger };
