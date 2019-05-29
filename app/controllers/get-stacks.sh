perf record -F 49 -p $(./get-pid.sh) --call-graph dwarf sleep 30s

perf script --header > /tmp/profile/$1
