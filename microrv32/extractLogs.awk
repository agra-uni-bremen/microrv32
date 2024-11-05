#!/usr/bin/env awk

#use: awk --use-lc-numeric -f extractLogs.awk <path-to-simulation.log>

BEGIN {
	buffer = "";

}
/^CPU time/ {
	printf("%0.f; ", $4);
}
/^num-instr/ {
	printf("%.0f; ", $3);
}
/^num-clk-cycle/ {
	printf("%.0f; ", $3);
}
/^CPI/ {
	printf("%.3f; ", $3);
}
/^IPC/ {
	printf("%.3f; ", $3);
}
/^IPS/ {
	printf("%.3f\n", $3);
}
END {
	print buffer;
}
