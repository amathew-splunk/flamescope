mkdir -p /opt/splunk/flamescope/profiles

# get the pid of the process runner
pid=$(ps aux | grep "\[process-runner\]" | awk '{print $2}')

# record the profiles
perf_4.9 record -F 49 -p $pid --call-graph dwarf sleep 30s

# save to 
perf_4.9 script --header > /opt/splunk/flamescope/profiles/$1
