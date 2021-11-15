process.env.NTBA_FIX_319 = 1;

require('dotenv').config();
const TelegramBot = require('node-telegram-bot-api');
const shell = require('shelljs');

const token = process.env.TELEGRAM_BOT_TOKEN;
exports.bot = new TelegramBot(token, { polling: false });
exports.groupChatId = process.env.TELEGRAM_GROUP_CHAT_ID;

exports.serverNo = shell.exec('cd ~/ && cat serverno', { silent: true }).stdout;

require('./checkList/timediff')
require('./checkList/validate')
require('./checkList/election')
