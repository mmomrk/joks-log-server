#!/usr/bin/env bash

echo Starting log server script

OPTIND=1

#seconds
delay=30
ADDR=ftp://192.168.10.240
tempList=list.files
logFile=fresh.log
lineCount=1000
commaDots=fixedCommas.dat
plottableFile=trimmed.dat

while getopts "h?d:l:" opt; do
	case "$opt" in
	h|\?)
		echo TODO show_help
		exit 0
		;;
	d)
		delay=$OPTARG
		echo Setting script refresh delay to $delay
		;;
	l)
		lineCount=$OPTARG
		echo Setting line count to $lineCount
		;;
	esac
done
delay=$delay\s
echo Delay is $delay

python -m SimpleHTTPServer &

while true; do
	wget -N $ADDR -O $tempList
	echo this
	nameHere=`tail -n 4 $tempList | head -n 1`
	echo name is in
	echo $nameHere
	filename=$(echo $nameHere| cut -c 27-70)
	echo Downloading this:
	echo $filename
	wget -N $filename -O $logFile
	#TODO add handling of error when wget fails
	echo Replacing commas to dots
	sed -r 's/,/\./g' $logFile > $commaDots
	echo Making trimmed file
	head -n 1  $commaDots > $plottableFile
	tail -n $lineCount $commaDots >> $plottableFile
	echo Generating image
	gnuplot plot.plt
	echo Sleeping
	sleep $delay
done

