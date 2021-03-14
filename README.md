# Benchmarking S3 Transfer tools

- awscli
- s5cmd
- aws-sdk (js)


# Setup

- dev/null server with 8 threads

```
WORKER_COUNT=8 node src/server.js
```


## Localhost 

- Server running on localhost:8080
- CPU: 3 Cores/6 Threads Intel(R) Core(TM) i7-10810U CPU @ 1.10GHz

|Client|Threads|Files|FileSize (MB)|TotalTransferred (MB)|Duration (s)|Speed (MB/s)|
|-|-|-|-|-|-|-|
aws-cli|1|16|256|4096|21.168|193.5
aws-sdk:js|1|16|256|4096|13.923|294.19
s5-cmd|1|16|256|4096|7.288|562.02
aws-cli|2|16|256|8192|38.174|214.6
aws-sdk:js|2|16|256|8192|18.253|448.8
s5-cmd|2|16|256|8192|11.987|683.41
aws-cli|4|16|256|16384|64.235|255.06
aws-sdk:js|4|16|256|16384|21.03|779.08
s5-cmd|4|16|256|16384|19.36|846.28
