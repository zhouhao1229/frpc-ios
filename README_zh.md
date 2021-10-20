基于https://github.com/fatedier/frp 最新版v0.37.1(2021.10为止最新版本)手动编译的ios framework，可在ios设备上运行的代码
参考https://github.com/FrpcCluster/frpc-IOS ,但这个版本太老了三年没维护了.基于0.21的版本在ios上真机运行会有些缺陷
于是自己拿frp v0.37.1的源码用golang编译成ios framework

## Frp Client Framework for iOS

### frp是啥?

> frp 是一个可用于内网穿透的高性能的反向代理应用，支持 tcp, udp 协议，为 http 和 https 应用协议提供了额外的能力，且尝试性支持了点对点穿透。

> 引自 `https://github.com/fatedier/frp`

### Frp Client Framework 能干啥?
##### 远程管理IOS设备, 随时随地远程VNC控制手机,远程SSH连接手机等(由于IOS机制限制,非越狱时只能代理当前APP,越狱后能获得完整手机控制权)

### 怎么用?
##### API说明:
```
// 一个API两个参数, 分别为配置文件路径, frp加密salt(默认为frp)
extern void FrpClientFrpc_main(NSString* cfgFile, NSString* salt);

// 如果使用官方Release的frp服务端,则调用代码为
FrpClientFrpc_main(@"app/config.ini", @"frp");
```

##### 配置文件样例(远程映射SSH)
```
# frpc.ini
[common]
server_addr = x.x.x.x(服务端地址)
server_port = 7000(服务端端口)
token = xxxx

[ssh]
type = tcp
local_ip = 127.0.0.1
local_port = 22
remote_port = 6000(映射后的ssh端口)
```

> 映射后使用 `ssh root@x.x.x.x -p 6000` 进行连接

### 结语
##### 如果您有疑问或者需要帮助或者需要编译最新版本,可以直接与我联系。
