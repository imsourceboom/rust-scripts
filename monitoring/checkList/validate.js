const cron = require('node-schedule');
const shell = require('shelljs');
const { bot, groupChatId, serverNo } = require('../app');

const second = Math.floor(Math.random() * 59) + 1;
cron.scheduleJob(`${second} */4 * * * *`, () => {
        shell.cd('~/rustcup/scripts');
        const validate = shell.exec('./ton-validate-state.sh', { silent: true }).stdout;

        if (!(validate === 'true\r\n')) {
                bot.sendMessage(groupChatId, `${serverNo}⛓ Not Validation`);
        }
})
