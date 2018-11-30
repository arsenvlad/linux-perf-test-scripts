server_ip=${1:-10.0.1.4}
sockperf ping-pong -i $server_ip -t 30 --msg-size 1400 --tcp