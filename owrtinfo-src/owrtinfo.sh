#!/bin/sh

while true
do
	hostname=$(uci get owrtinfo.owrtinfo.hostname)
	kernel=$(uci get owrtinfo.owrtinfo.kernel)
	openwrt_version=$(uci get owrtinfo.owrtinfo.openwrt_version)
	wanip=$(uci get owrtinfo.owrtinfo.wanip)
	logger_output1=$logger_output
	netmask=$(uci get network.wan.netmask)
	
	if [ $hostname == 1 ]; then 
		hostname1=$(ubus call system board | jsonfilter -e '@["hostname"]')
		logger_output="hostname: $hostname1"
	fi
	if [ $kernel == 1 ]; then 
		kernel1=$(ubus call system board | jsonfilter -e '@["kernel"]')
		logger_output="${logger_output}; kernel: $kernel1"
	fi
	if [ $openwrt_version == 1 ]; then 
		openwrt_version1=$(ubus call system board | jsonfilter -e '@["release"]["description"]')
		logger_output=" ${logger_output}; openwrt_version: $openwrt_version1"
	fi
	if [ $wanip == 1 ]; then
		wanip1=$(uci get network.wan.ipaddr)
		logger_output=" ${logger_output}; wanip: $wanip1"
		case "$netmask" in
			"0.0.0.0") logger_output=" ${logger_output}/0 "
			;;
			"128.0.0.0") logger_output=" ${logger_output}/1 "
			;;
			"192.0.0.0") logger_output=" ${logger_output}/2 "
			;;
			"224.0.0.0") logger_output=" ${logger_output}/3 "
			;;
			"240.0.0.0") logger_output=" ${logger_output}/4 "
			;;
			"248.0.0.0") logger_output=" ${logger_output}/5 "
			;;
			"252.0.0.0") logger_output=" ${logger_output}/6 "
			;;
			"254.0.0.0") logger_output=" ${logger_output}/7 "
			;;
			"255.0.0.0") logger_output=" ${logger_output}/8 "
			;;
			"255.128.0.0") logger_output=" ${logger_output}/9 "
			;;
			"255.192.0.0") logger_output=" ${logger_output}/10 "
			;;
			"255.224.0.0") logger_output=" ${logger_output}/11 "
			;;
			"255.240.0.0") logger_output=" ${logger_output}/12 "
			;;
			"255.258.0.0") logger_output=" ${logger_output}/13 "
			;;
			"255.252.0.0") logger_output=" ${logger_output}/14 "
			;;
			"255.254.0.0") logger_output=" ${logger_output}/15 "
			;;
			"255.255.0.0") logger_output=" ${logger_output}/16 "
			;;
			"255.255.128.0") logger_output=" ${logger_output}/17 "
			;;
			"255.255.192.0") logger_output=" ${logger_output}/18 "
			;;
			"255.255.224.0") logger_output=" ${logger_output}/19 "
			;;
			"255.255.240.0") logger_output=" ${logger_output}/20 "
			;;
			"255.255.248.0") logger_output=" ${logger_output}/21 "
			;;
			"255.255.252.0") logger_output=" ${logger_output}/22 "
			;;
			"255.255.254.0") logger_output=" ${logger_output}/23 "
			;;
			"255.255.255.0") logger_output=" ${logger_output}/24 "
			;;
			"255.255.255.128") logger_output=" ${logger_output}/25 "
			;;
			"255.255.255.192") logger_output=" ${logger_output}/26 "
			;;
			"255.255.255.224") logger_output=" ${logger_output}/27 "
			;;
			"255.255.255.240") logger_output=" ${logger_output}/28 "
			;;
			"255.255.255.248") logger_output=" ${logger_output}/29 "
			;;
			"255.255.255.252") logger_output=" ${logger_output}/30 "
			;;
			"255.255.255.254") logger_output=" ${logger_output}/31 "
			;;
			"255.255.255.255") logger_output=" ${logger_output}/32 "
			;;		
		esac
	fi
	if [ "$logger_output" != "$logger_output1" ]; then
		logger -t owrtinfo "$logger_output"
	fi
	
	sleep 10
done
