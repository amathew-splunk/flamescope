# Make sure profile directory exists and change to it
mkdir -p $1
mkdir -p $1/dump
cd $1

# touch to mark in progress
touch $1/dump/$2

# get the pid of the process runner
# pid=$(ps aux | grep "\[process-runner\]" | awk '{print $2}')

# get the pid of splunkd
pid=$(ps aux | grep 17089 | grep -v "process-runner" | grep -v "grep"  | awk '{print $2}')

# record the profiles
perf_4.9 record -F 99 -p $pid --call-graph dwarf -o $1/dump/$2 sleep 300s
perf_4.9 script -i $1/dump/$2 --header > $1/$2

# cleanup to show finished
rm $1/dump/$2
