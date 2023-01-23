
## python

```
(base) rs@ryzen:~/code/github.com/renerocksai/zap-endpoint-tests$ ./measure.sh python
THE PID IS 61866
========================================================================
                          python
========================================================================
Running 10s test @ http://127.0.0.1:3000/users
  10 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    69.66ms    4.25ms  82.02ms   89.14%
    Req/Sec   143.52     42.10   202.00     33.20%
  Latency Distribution
     50%   70.01ms
     75%   71.54ms
     90%   72.97ms
     99%   76.28ms
  14297 requests in 10.01s, 2.47MB read
Requests/sec:   1428.74
Transfer/sec:    252.87KB
FINISHED, SLEEPING 10s
(base) rs@ryzen:~/code/github.com/renerocksai/zap-endpoint-tests$ ./measure.sh python
THE PID IS 76337
========================================================================
                          python
========================================================================
Running 10s test @ http://127.0.0.1:3000/users
  10 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    68.82ms    4.39ms  78.95ms   87.82%
    Req/Sec   145.31     42.37   202.00     34.80%
  Latency Distribution
     50%   69.18ms
     75%   70.86ms
     90%   72.38ms
     99%   76.24ms
  14472 requests in 10.01s, 2.50MB read
Requests/sec:   1446.08
Transfer/sec:    255.94KB
FINISHED, SLEEPING 10s
(base) rs@ryzen:~/code/github.com/renerocksai/zap-endpoint-tests$ ./measure.sh python
THE PID IS 91000
========================================================================
                          python
========================================================================
Running 10s test @ http://127.0.0.1:3000/users
  10 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    68.52ms    4.34ms  78.19ms   87.25%
    Req/Sec   146.00     42.39   202.00     35.40%
  Latency Distribution
     50%   68.79ms
     75%   70.50ms
     90%   72.22ms
     99%   75.13ms
  14543 requests in 10.01s, 2.51MB read
Requests/sec:   1453.50
Transfer/sec:    257.25KB
FINISHED, SLEEPING 10s
```

## zig 

```
(base) rs@ryzen:~/code/github.com/renerocksai/zap-endpoint-tests$ ./measure.sh zig
THE PID IS 106113
========================================================================
                          zig
========================================================================
Running 10s test @ http://127.0.0.1:3000/users
  10 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     2.43ms   13.51ms 180.83ms   97.60%
    Req/Sec    18.26k     2.72k   23.97k    92.38%
  Latency Distribution
     50%  487.00us
     75%    0.88ms
     90%    1.47ms
     99%   77.46ms
  1817794 requests in 10.10s, 293.65MB read
Requests/sec: 179983.58
Transfer/sec:     29.07MB
FINISHED, SLEEPING 10s
(base) rs@ryzen:~/code/github.com/renerocksai/zap-endpoint-tests$ ./measure.sh zig
THE PID IS 108527
========================================================================
                          zig
========================================================================
Running 10s test @ http://127.0.0.1:3000/users
  10 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     2.52ms   14.12ms 186.87ms   97.58%
    Req/Sec    18.44k     2.83k   24.51k    93.59%
  Latency Distribution
     50%  484.00us
     75%    0.87ms
     90%    1.46ms
     99%   80.83ms
  1834189 requests in 10.10s, 296.31MB read
Requests/sec: 181605.01
Transfer/sec:     29.34MB
FINISHED, SLEEPING 10s
(base) rs@ryzen:~/code/github.com/renerocksai/zap-endpoint-tests$ ./measure.sh zig
THE PID IS 110937
========================================================================
                          zig
========================================================================
Running 10s test @ http://127.0.0.1:3000/users
  10 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     2.52ms   14.10ms 187.67ms   97.56%
    Req/Sec    18.51k     2.99k   38.15k    93.07%
  Latency Distribution
     50%  480.00us
     75%    0.87ms
     90%    1.46ms
     99%   80.12ms
  1839710 requests in 10.10s, 297.20MB read
Requests/sec: 182171.28
Transfer/sec:     29.43MB
FINISHED, SLEEPING 10s
```
