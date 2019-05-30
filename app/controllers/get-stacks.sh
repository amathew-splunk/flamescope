# Make sure profile directory exists and change to it
mkdir -p $1
cd $1

# get the pid of the process runner
pid=$(ps aux | grep "\[process-runner\]" | awk '{print $2}')

# record the profiles
perf_4.9 record -F 49 -p $pid --call-graph dwarf sleep 30s

# save to 
perf_4.9 script --header > $1/$2
