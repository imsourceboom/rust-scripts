const cron = require('node-schedule');
const shell = require('shelljs');
const { bot, groupChatId, serverNo } = require('../app');

const second = Math.floor(Math.random() * 59) + 1;
cron.scheduleJob(`${second} */10 * * * *`, () => {
  shell.cd('~/rust-scripts/scripts');
  const result = shell
    .exec('./rust-timediff.sh', { silent: true })
    .stdout.replace(/\n/g, ',')
    .slice(0, -1);
  const timeDiff = Number(
    shell.exec(`echo ${result} | cut -d ',' -f 1`).stdout
  );
  const shardsTimeDiff = Number(
    shell.exec(`echo ${result} | cut -d ',' -f 2`).stdout
  );
  const syncStatus = shell
    .exec(`echo ${result} | cut -d ',' -f 3`)
    .stdout.replace(/\n/g, '');

  if (
    !(1 < timeDiff && timeDiff < 100) ||
    !(1 < shardsTimeDiff && shardsTimeDiff < 100) ||
    syncStatus != 'synchronization_finished'
  ) {
    bot.sendMessage(
      groupChatId,
      `${serverNo}🕞 Sync off\nMaster SYNC: ${timeDiff}\nShard SYNC: ${shardsTimeDiff}\nSync Status: ${syncStatus}`
    );
  }
});
