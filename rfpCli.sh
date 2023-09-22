#!/bin/bash


echo "Renesas Flash Progrmmer"
date >> history.txt

okPrg=0
errPrg=0
res=0


for (( ; ; ))
do
	read -p "Press any key to Start, press q to quit: " cmd


	if [ $cmd = 'q' ];then
		echo "quit"
		echo "ok:$okPrg err:$errPrg"
		echo "ok:$okPrg err:$errPrg" >> history.txt
		break
		

	else
		./rfp-cli -d rl78 -port COMx -dtr-inv -a "C:\rfp\sample.mot"
		#echo "Hi\n"
		res=$?
		if [ $res = 0 ]; then
			((okPrg++))
		else
			((errPrg++))
		fi
		echo "ok:$okPrg err:$errPrg" 
		#$okPrg | ":" | $errPrg >> history.txt
	fi
done


