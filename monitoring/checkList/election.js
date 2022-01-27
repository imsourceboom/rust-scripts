const cron = require('node-schedule');
const shell = require('shelljs');
const { bot, electionChatId, serverNo } = require('../app');

const second = Math.floor(Math.random() * 59) + 1;
cron.scheduleJob(`${second} */10 * * * *`, () => {
  shell.cd('~/rust-scripts/scripts');
  const election = shell
    .exec('./rust-election-state.sh', { silent: true })
    .stdout.replace(/\n/g, '');

  const electionFunc = async () => {
    if (election === 'ACTIVE') {
      const electionStartTime = Number(
        shell.exec('./rust-election-start.sh', { silent: true }).stdout
      );
      const electionEndTime = Number(
        shell.exec('./rust-election-end.sh', { silent: true }).stdout
      );
      const currentTime = Number(
        shell.exec('date +%s', { silent: true }).stdout
      );

      if (
        currentTime - electionStartTime > 7200 &&
        electionEndTime - currentTime > 300
      ) {
        const participant = shell
          .exec('./rust-participant-state.sh', { silent: true })
          .stdout.replace(/\n/g, '');
        const checkDate = shell.exec('date "+%Y-%m-%d %a %H:%M:%S"', {
          silent: true,
        });

        if (participant !== 'ACTIVE') {
          bot.sendMessage(
            electionChatId,
            `${serverNo}‼️  Not in Election\n${checkDate}`
          );
        }
      }
    }
  };
  electionFunc();
});
