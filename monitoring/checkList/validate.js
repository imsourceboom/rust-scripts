const cron = require('node-schedule');
const shell = require('shelljs');
const { bot, groupChatId, serverNo } = require('../app');

const second = Math.floor(Math.random() * 59) + 1;
cron.scheduleJob(`${second} */10 * * * *`, () => {
  shell.cd('~/rust-scripts/scripts');
  const validate = shell
    .exec('./rust-validate-state.sh', { silent: true })
    .stdout.replace(/\r|\n/g, '');

  if (validate !== 'true') {
    bot.sendMessage(groupChatId, `${serverNo}⛓ Not Validation`);
  }
});
