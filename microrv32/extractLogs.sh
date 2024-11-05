#!/usr/bin/env bash

shopt -s extglob

extractLogsToCSV() {
	echo "benchmark; host-cpu-time-ns; instruction-count; cycle-count; cpi; ipc; ips" > sw/embench-split-prebuilt/summary.log
	for benchmarkPath in sw/embench-split-prebuilt/!(huffbench|md5sum|qrduino|picojpeg|sglib-combined|tarfind|wikisort); do
		benchmarkName=$(basename $benchmarkPath)
		if [ "${benchmarkName}" != "summary.log" ]; then
			echo $benchmarkName
			data=$(awk -f extractLogs.awk ${benchmarkPath}/simulation.log)
			echo "${benchmarkName}; ${data}" >> sw/embench-split-prebuilt/summary.log
		fi
	done;
}

extractLogsToCSV
