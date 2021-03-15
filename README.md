# Benchmarking S3 Transfer tools

- awscli
- [s5cmd](https://github.com/peak/s5cmd)
- [aws-sdk (js)](https://github.com/aws/aws-sdk-js) v2.862.0


# Setup

Random data can be created with `./make-data.sh` which is generated into `data/`

|Name|File Count|File Size|Total Size|
|-|-|-|-|
|data/2048|2|2GB|4GB
|data/256|16|256MB|4GB|

## Mock s3 API
- dev/null server with 4 threads

```
WORKER_COUNT=4 node src/server.js
```

On a high end desktop CPU a single nodejs thread can process >1GB/s


## Localhost 
Testing with Both Client and Server on the same machine

### Linux Laptop (HP 840 G7)
- Server running on http://localhost:8080
- CPU: 3 Cores/6 Threads Intel i7-10810U 
- OS: Ubuntu 20.04

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

### Linux Desktop

- Server running on http://localhost:8080
- CPU: 16 Cores/32 Threads AMD Ryzen 9 5950X
- OS: Ubuntu 21.04

Client|Threads|Files|FileSize (MB)|TotalTransferred (MB)|Duration (s)|Speed (MB/s)
-|-|-|-|-|-|-
aws-cli|1|16|256|4096|16.359|250.38
aws-sdk:js|1|16|256|4096|4.16|984.62
s5-cmd|1|16|256|4096|3.451|1186.9
aws-cli|2|32|256|8192|13.865|590.84
aws-sdk:js|2|32|256|8192|4.624|1771.63
s5-cmd|2|32|256|8192|4.032|2031.75
aws-cli|4|64|256|16384|13.307|1231.23
aws-sdk:js|4|64|256|16384|7.121|2300.8
s5-cmd|4|64|256|16384|5.953|2752.23
aws-cli|8|128|256|32768|20.236|1619.29
aws-sdk:js|8|128|256|32768|15.02|2181.62
s5-cmd|8|128|256|32768|10.931|2997.71

