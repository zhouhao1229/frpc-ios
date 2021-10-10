## Frp Client Framework for iOS

[README](README.md) | [中文文档](README_zh.md)

base on https://github.com/fatedier/frp v0.37.1(the lastest at 2021.10) ios framework,it can run on your iphone 

I try to use https://github.com/FrpcCluster/frpc-IOS, but this version is too old for three years and has not been maintained. The version based on 0.21 will have some defects when running on the real machine on ios.
So I pulled the source code of frp v0.37.1 and compiled it into ios framework with golang。

### What is frp?

>frp is a fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet. As of now, it supports tcp & udp, as well as http and https protocols, where requests can be forwarded to internal services by domain name.

> quote: `https://github.com/fatedier/frp`

### What is Frp Client Framework?
##### Connect to frp server, shoul connect to iOS device like ddns(vnc/ssh/etc...).

### How to use?
##### API:
```
// arg1: config path
// arg2: frp salt(default frp)
extern void FrpClientFrpc_main(NSString* cfgFile, NSString* salt);

// e.g.:
FrpClientFrpc_main(@"app/config.ini", @"frp");
```

##### config.ini(nat to ssh)
```
# frpc.ini
[common]
server_addr = x.x.x.x(server ip)
server_port = 7000(server port)
toke = xxxx

[ssh]
type = tcp
local_ip = 127.0.0.1
local_port = 22
remote_port = 6000(remote ssh port)
```

> use `ssh root@x.x.x.x -p 6000` to connect.

### Donation

##### If you have any questions or need help, or need to compile the latest version, you can contact me directly.
