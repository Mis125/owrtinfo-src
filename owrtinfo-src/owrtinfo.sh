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
	fi
	if [ $netmask == 0.0.0.0 ]; then
		netmask1=0
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 128.0.0.0 ]; then
		netmask1=1
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 192.0.0.0 ]; then
		netmask1=2
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 224.0.0.0 ]; then
		netmask1=3
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 240.0.0.0 ]; then
		netmask1=4
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 248.0.0.0 ]; then
		netmask1=5
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 252.0.0.0 ]; then
		netmask1=6
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 254.0.0.0 ]; then
		netmask1=7
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.0.0.0 ]; then
		netmask1=8
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.128.0.0 ]; then
		netmask1=9
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.192.0.0 ]; then
		netmask1=10
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.224.0.0 ]; then
		netmask1=11
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.240.0.0 ]; then
		netmask1=12
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.248.0.0 ]; then
		netmask1=13
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.252.0.0 ]; then
		netmask1=14
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.254.0.0 ]; then
		netmask1=15
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.255.0.0 ]; then
		netmask1=16
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.255.128.0 ]; then
		netmask1=17
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.255.192.0 ]; then
		netmask1=18
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.255.224.0 ]; then
		netmask1=19
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.255.240.0 ]; then
		netmask1=20
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.255.248.0 ]; then
		netmask1=21
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.255.252.0 ]; then
		netmask1=22
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.255.254.0 ]; then
		netmask1=23
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.255.255.0 ]; then
		netmask1=24
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.255.255.128 ]; then
		netmask1=25
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.255.255.192 ]; then
		netmask1=26
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.255.255.224 ]; then
		netmask1=27
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.255.255.240 ]; then
		netmask1=28
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.255.255.248 ]; then
		netmask1=29
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.255.255.252 ]; then
		netmask1=30
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.255.255.254 ]; then
		netmask1=31
		logger_output="${logger_output}/$netmask1"
	fi
	if [ $netmask == 255.255.255.255 ]; then
		netmask1=32
		logger_output="${logger_output}/$netmask1"
	fi
	if [ "$logger_output" != "$logger_output1" ]; then
		logger -t owrtinfo "$logger_output"
	fi
	
	sleep 10
done
