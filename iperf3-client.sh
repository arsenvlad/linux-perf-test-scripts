server_ip=${1:-10.0.1.4}
iperf3 -c $server_ip
iperf3 -c $server_ip --reverse
iperf3 -c $server_ip -P8
iperf3 -c $server_ip -P8 --reverse
iperf3 -c $server_ip -u -b 0
iperf3 -c $server_ip -u -b 0 --reverse
iperf3 -c $server_ip -u -b 0 -l 1400
iperf3 -c $server_ip -u -b 0 -l 1400 --reverse