#!/usr/bin/env bash

shopt -s extglob

extractLogsToCSV() {
	# echo "benchmark; host-cpu-time-ns; instruction-count; cycle-count; cpi; ipc; ips; Date; Configuration" > sw/embench-split-prebuilt/summary.log
	echo "benchmark; host-cpu-time-ns; instruction-count; cycle-count; cpi; ipc; ips; Date; Configuration" > sw/embench-split-prebuilt/summary.csv
	for benchmarkPath in sw/embench-split-prebuilt/!(huffbench|md5sum|qrduino|picojpeg|sglib-combined|tarfind|wikisort); do
	# for benchmarkPath in sw/embench-split-prebuilt; do
		benchmarkName=$(basename $benchmarkPath)
		# if [ "${benchmarkName}" != "summary.log" ]; then
		if [ "${benchmarkName}" != "summary.csv" ]; then
			echo $benchmarkName
			data=$(awk -f extractLogs.awk ${benchmarkPath}/simulation.log)
			echo "${benchmarkName}; ${data}" >> sw/embench-split-prebuilt/summary.csv
		fi
	done;
}

extractLogsToCSV
