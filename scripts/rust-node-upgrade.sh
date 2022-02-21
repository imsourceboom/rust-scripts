#!/bin/bash

SERVER_NO=$(cat $HOME/serverno)
GROUP_NO=0

PREV=0

cd $HOME/main.ton.dev/scripts
tmux new -ds upgrade

for (( i = 3; i <= 198; i+=3 ))
do
	if [ $SERVER_NO -gt $PREV -a $SERVER_NO -le $i ]; then
		GROUP_NO=$(( $i / 3 - 1 ))
		tmux send -t upgrade.0 "sleep $((1200 * $GROUP_NO)) && ./upgrade.sh 2>&1 | tee ./upgrade.log && sleep 100 && getstats | grep -E 'console|COMMIT_ID|node_version'" ENTER
	fi

	PREV=$i
done
