#!/bin/sh

func_start(){
	mkdir -p '/etc/storage/adguard/saved_data'
	touch  '/etc/storage/adguard/saved_data/sessions.db'
	touch  '/etc/storage/adguard/saved_data/stats.db'
	mkdir -p '/tmp/adguard'
	ln -sf '/etc/storage/adguard/saved_data/sessions.db' '/tmp/adguard/sessions.db'
	ln -sf '/etc/storage/adguard/saved_data/stats.db' '/tmp/adguard/stats.db'
	if [ ! -L '/etc/storage/adguard/data' ]; then
		ln -s '/tmp/adguard' '/etc/storage/adguard/data'
	fi
	start-stop-daemon -S -b -x adguard -- -w /etc/storage/adguard -l syslog
}

func_stop(){
	killall -q adguard
	sleep 1
}

case "$1" in
start)
        func_start
        ;;
stop)
        func_stop
        ;;
restart)
        func_stop
        func_start
        ;;
*)
        echo "Usage: $0 { start | stop | restart }"
        exit 1
        ;;
esac
