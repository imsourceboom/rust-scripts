const cron = require('node-schedule');
const shell = require('shelljs');
const { bot, electionChatId, serverNo } = require('../app');

const second = Math.floor(Math.random() * 59) + 1;
cron.scheduleJob(`${second} */10 * * * *`, () => {
  shell.cd('~/rust-scripts/scripts');
  const dbAvail = Number(shell.exec('./db-check.sh', { silent: true }).stdout);

  if (dbAvail <= 50) {
    bot.sendMessage(electionChatId, `${serverNo}💾 DB Avail: ${dbAvail}G`);
  }
});
