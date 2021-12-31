const cron = require('node-schedule');
const shell = require('shelljs');
const { bot, groupChatId, serverNo } = require('../app');

const second = Math.floor(Math.random() * 59) + 1;
cron.scheduleJob(`${second} */4 * * * *`, () => {
	shell.cd('~/rust-scripts/scripts');
	const timeDiff = Number(shell.exec('./rust-timediff.sh', { silent: true }).stdout);
	
	if (!(1 < timeDiff && timeDiff < 100)) {
		bot.sendMessage(groupChatId, `${serverNo}🕞 Sync off, SYNC: ${timeDiff}`);
	}
})
