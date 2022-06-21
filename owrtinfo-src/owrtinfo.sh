#!/bin/sh

while true
do
	hostname=$(uci get owrtinfo.owrtinfo.hostname)
	kernel=$(uci get owrtinfo.owrtinfo.kernel)
	openwrt_version=$(uci get owrtinfo.owrtinfo.openwrt_version)
	wanip=$(uci get owrtinfo.owrtinfo.wanip)
	logger_output1=$logger_output
	if [ $hostname == 1 ]; then 
		hostname1=$(ubus call system board | jsonfilter -e '@["hostname"]')
		logger_output="hostname: $hostname1"
	fi
	if [ $kernel == 1 ]; then 
		kernel1=$(ubus call system board | jsonfilter -e '@["kernel"]')
		logger_output="$(logger_output); kernel: $kernel1"
	fi
	if [ $openwrt_version == 1 ]; then 
		openwrt_version1=$(ubus call system board | jsonfilter -e '@["release"]["description"]')
		logger_output=" $(logger_output); openwrt_version: $openwrt_version1"
	fi
	if [ $wanip == 1 ]; then
		wanip1=$(uci get network.wan.ipaddr)
		logger_output=" $(logger_output); wanip: $wanip1"
	fi
	if [ "$logger_output" != "$logger_output1" ]; then
		logger -t owrtinfo "$logger_output"
	fi
	sleep 10
done
