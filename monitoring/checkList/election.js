const cron = require('node-schedule');
const shell = require('shelljs');
const { bot, groupChatId, serverNo } = require('../app');

const second = Math.floor(Math.random() * 59) + 1;
cron.scheduleJob(`${second} */3 * * * *`, () => {
    shell.cd('~/rust-scripts/scripts');
    const election = shell.exec('./rust-election-state.sh', { silent:true }).stdout;

    const electionFunc = async () => {
        if (election === 'ACTIVE\n') {
            const electionStartTime = Number(shell.exec('./rust-election-start.sh', {silent:true}).stdout);
            const currentTime = Number(shell.exec('date +%s', { silent:true }).stdout);

            if (currentTime - electionStartTime > 3600) {
                const participant = shell.exec('./rust-participant-state.sh', { silent:true }).stdout;
                const checkDate = shell.exec('date "+%Y-%m-%d %H:%M:%S"', { silent:true });

                if (participant === 'NOT_FOUND\n') {
                    bot.sendMessage(groupChatId, `${serverNo}‼️  Not in Election\n${checkDate}`)
                }
            }

        }
    }
    electionFunc();
})
