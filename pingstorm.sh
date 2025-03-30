#!/bin/bash

#list of websites to check
SERVICES=("google.com" "facebook.com" "youtube.com" "tiktok.com" "netflix.com")

#results file name
output_file="ping_results.txt"

> "$output_file"


echo "PingStorm - Internet Latency time Checker"
echo "---------------------------------------"

for service in "${SERVICES[@]}";do
	echo "Checking $service ..."

	avg_time=$(ping -c 5 "$service" | awk -F'/' 'END {print $5}')

	if [ -z "$avg_time" ]; then
		echo "$service is unreachable" >> "$output_file"
	else
		echo "$service - Average latency: $avg_time ms" >> "$output_file"
		fi
	done
echo "ping results saved to file $output_file"
