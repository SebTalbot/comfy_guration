#!/usr/bin/env bash

TEMP=`getopt -n "playerctl-cmus" -o "hp:lV" --long "help,player:,list-all,version" -- "$@"`

[ $? ] || { exit 1; }

eval set -- "$TEMP"

_help () {
	cat << eof
A simple wrapper for playerctl which adds support for cmus

Usage
    $0 [OPTION...] COMMAND

Help Options:
    -h, --help            Show help options

Application Options:
    -p, --player=NAME     The name of the player to control (default: the first available player)
    -l, --list-all        List the names of running players that can be controlled
    -V, --version         Print version information and exit

Available Commands:
    play                  Command the player to play
    pause                 Command the player to pause
    play-pause            Command the player to toggle between play/pause
    stop                  Command the player to stop
    next                  Command the player to skip to the next track
    previous              Command the player to skip to the previous track
    volume [LEVEL]        Print or set the volume to LEVEL from 0.0 to 1.0
    status                Get the play status of the player
    metadata [KEY]        Print metadata information for the current track. Print only value of KEY if passed
eof
exit 0;
}

_version () { echo "$0 version 0.1 -- Copyright (C) 2015 Lorenzo Mureu <mureulor@gmail.com>"; exit 0; }

_list () {
	players=`playerctl -l 2>&1`
	echo List of player supported by playerctl:
	echo -e \\t${players}\\n
	echo This version also supports cmus, which is tried before all other players. If option -p or --player= are used, cmus is skipped and all control is passed to playerctl.
	exit 0;
}

_info () {
	tmp=`mktemp`
	if cmus-remote -Q  &> /dev/null
	then
		title='cmus'
		echo -e Status: $($0 status) '\n' >> $tmp

		echo Artist:  $($0 -p cmus metadata artist) >> $tmp
		echo Album:  $($0 -p cmus metadata album) >> $tmp
		echo Title:  $($0 -p cmus metadata title) >> $tmp
	else
		title=$(playerctl -l  |cut -f1 -d' ')
		echo -e Status: $(playerctl status) '\n' >> $tmp
		echo Artist: $(playerctl metadata xesam:artist) >> $tmp
		echo Album:  $(playerctl metadata xesam:album) >> $tmp
		echo Title:  $(playerctl metadata xesam:title) >> $tmp
	fi
	#title="$title -- palyerctl-cmus"
	cat $tmp
	kdialog --title "${title}" --passivepopup "$(cat $tmp)" 3
	rm $tmp
}
		

PLAYER="cmus"
while true ; do
	case "$1" in
		-h|--help) 		_help; 		shift ;;
		-V|--version)		_version; 	shift ;;
		-l|--list-all)		_list;    	shift ;;
		-p|--player)		PLAYER="$2";	shift 2 ;;
		--) shift; break;;
		*) echo "Internal error" > /dev/stderr ; exit 3 ;; 
	esac
done

[ $# -eq 0 ] && _help

SKIPCMUS=1
cmus-remote -Q  &> /dev/null && [ ${PLAYER}x = "cmusx" ] && SKIPCMUS=0
[ $# -eq 1 ] && [ $1 == "info" ] && SKIPCMUS=0

[ $SKIPCMUS -eq 1 ] &&  exec playerctl $@ 

case $1 in 
	play) 		cmus-remote -p ;;
	pause)		cmus-remote -u ;;
	play-pause)     [ $(cmus-remote -Q | grep status | cut -d' ' -f2)x = playingx  ] && cmus-remote -u || cmus-remote -p ;;              
	stop)		cmus-remote -s ;;
	next)		cmus-remote -n ;;
	previous)	cmus-remote -r ;;
	volume)		[ $# -eq 2 ] && cmus-remote -v $2 || cmus-remote -Q | grep vol_ ;;
	status)		cmus-remote -Q | awk '/^status/ {print $2}' ;;
	metadata)	
		if [ $# -eq 2 ]
		then
			cmus-remote -Q | awk "/^tag $2/ {print}" | cut -f1,2 -d' ' --complement #sed "s/tag $2//"
		else
			cmus-remote -Q | awk "/^tag / {print}" | cut -f1 -d' ' --complement #sed "s/tag $2//"
		fi
	;;
		#| grep tag | grep $2 || cmus-remote -Q ;;
	info) _info ;;
	*)	echo "Unknown option '$1'" > /dev/stderr ; exit 4 ;;
esac
