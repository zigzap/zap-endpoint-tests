#! /usr/bin/env bash
THREADS=10
# our work laptop runs into socket/fd issues with more than ~1000 connections
CONNECTIONS=1000
DURATION_SECONDS=10
SCRIPT=./post-script.lua

SUBJECT=$1


if [ "$SUBJECT" = "" ] ; then
    echo "usage: $0 subject    # subject: zig or go"
    exit 1
fi

if [ "$SUBJECT" = "zig" ] ; then
    zig build -Drelease-fast > /dev/null
    ./zig-out/bin/zap-endpoint-tests > zig.out 2> zig.err &
    PID=$!
    URL=http://127.0.0.1:3000/users
fi

# if [ "$SUBJECT" = "go" ] ; then
#     cd wrk/go && go build main.go 
#     ./main &
#     PID=$!
#     URL=http://127.0.0.1:8090/hello
# fi

if [ "$SUBJECT" = "python" ] ; then
    cd python
    python main.py > /dev/null 2>&1 &
    PID=$!
    URL=http://127.0.0.1:3000/users
fi

sleep 1
echo "========================================================================"
echo "                          $SUBJECT"
echo "========================================================================"
wrk -c $CONNECTIONS -t $THREADS -d $DURATION_SECONDS -s $SCRIPT --latency $URL 

kill $PID

