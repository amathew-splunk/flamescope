# Make sure profile directory exists and change to it
mkdir -p $1
mkdir -p $1/dump
cd $1

# get the pid of the process runner
pid=$(ps aux | grep "\[process-runner\]" | awk '{print $2}')

# record the profiles
perf_4.9 record -F 99 -p $pid --call-graph dwarf sleep 30s -o $1/dump/$2
perf_4.9 script -i $1/dump/$2 --header > $1/$2
