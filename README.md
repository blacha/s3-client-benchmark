# Benchmarking S3 Transfer tools

- awscli v1.19.27
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
aws-cli|1|32|128|4096|20.455|200.24
aws-sdk:js|1|32|128|4096|4.499|910.42
s5-cmd|1|32|128|4096|6.418|638.21
aws-cli|2|64|128|8192|17.885|458.04
aws-sdk:js|2|64|128|8192|5.318|1540.43
s5-cmd|2|64|128|8192|6.458|1268.5
aws-cli|4|128|128|16384|17.081|959.19
aws-sdk:js|4|128|128|16384|7.581|2161.19
s5-cmd|4|128|128|16384|6.86|2388.34
aws-cli|8|256|128|32768|24.684|1327.5
aws-sdk:js|8|256|128|32768|15.424|2124.48
s5-cmd|8|256|128|32768|9.849|3327.04
aws-cli|1|16|256|4096|16.201|252.82
aws-sdk:js|1|16|256|4096|4.097|999.76
s5-cmd|1|16|256|4096|3.493|1172.63
aws-cli|2|32|256|8192|14.173|578
aws-sdk:js|2|32|256|8192|4.71|1739.28
s5-cmd|2|32|256|8192|4.184|1957.93
aws-cli|4|64|256|16384|13.797|1187.5
aws-sdk:js|4|64|256|16384|7.255|2258.3
s5-cmd|4|64|256|16384|6.086|2692.08
aws-cli|8|128|256|32768|20.039|1635.21
aws-sdk:js|8|128|256|32768|14.8|2214.05
s5-cmd|8|128|256|32768|11.269|2907.8
aws-cli|1|8|512|4096|13.727|298.39
aws-sdk:js|1|8|512|4096|3.984|1028.11
s5-cmd|1|8|512|4096|3.336|1227.82
aws-cli|2|16|512|8192|11.689|700.83
aws-sdk:js|2|16|512|8192|4.529|1808.79
s5-cmd|2|16|512|8192|3.632|2255.51
aws-cli|4|32|512|16384|11.273|1453.38
aws-sdk:js|4|32|512|16384|7.025|2332.24
s5-cmd|4|32|512|16384|5.255|3117.79
aws-cli|8|64|512|32768|17.511|1871.28
aws-sdk:js|8|64|512|32768|14.453|2267.21
s5-cmd|8|64|512|32768|9.202|3560.97
aws-cli|1|2|2048|4096|12.854|318.66
aws-sdk:js|1|2|2048|4096|3.956|1035.39
s5-cmd|1|2|2048|4096|3.145|1302.38
aws-cli|2|4|2048|8192|10.833|756.21
aws-sdk:js|2|4|2048|8192|4.416|1855.07
s5-cmd|2|4|2048|8192|3.45|2374.49
aws-cli|4|8|2048|16384|10.54|1554.46
aws-sdk:js|4|8|2048|16384|7.008|2337.9
s5-cmd|4|8|2048|16384|4.668|3509.85
aws-cli|8|16|2048|32768|16.051|2041.49
aws-sdk:js|8|16|2048|32768|14.265|2297.09
s5-cmd|8|16|2048|32768|9.365|3498.99
aws-cli|1|1|4098|4098|12.217|335.43
aws-sdk:js|1|1|4098|4098|3.797|1079.27
s5-cmd|1|1|4098|4098|2.97|1379.8
aws-cli|2|2|4098|8196|10.64|770.3
aws-sdk:js|2|2|4098|8196|4.478|1830.28
s5-cmd|2|2|4098|8196|3.095|2648.14
aws-cli|4|4|4098|16392|9.827|1668.06
aws-sdk:js|4|4|4098|16392|6.845|2394.74
s5-cmd|4|4|4098|16392|4.298|3813.87
aws-cli|8|8|4098|32784|15.377|2132.02
aws-sdk:js|8|8|4098|32784|14.163|2314.76
s5-cmd|8|8|4098|32784|8.958|3659.75
