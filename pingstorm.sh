#!/bin/bash

#list of websites to check
SERVICES=("google.com" "facebook.com" "youtube.com" "tiktok.com" "netflix.com")

echo "PingStorm - Internet Latency time Checker"
echo "---------------------------------------"

for service in "${SERVICES[@]}";do
	echo "Checking $service ..."

	avg_time=$(ping -c 5 "$service" | awk -F'/' 'END {print $5}')

	if [ -z "$avg_time" ]; then
		echo "$service is unreachable"
	else
		echo "$service - Average latency: $avg_time ms"
		fi
	done

