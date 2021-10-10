## 编译ios-SDK环境指南

* xcode ≥ 9.x

* 安装 go

```
wget https://dl.google.com/go/go1.11.2.darwin-amd64.pkg
```

* 安装 gomobile 安卓开发环境

```
mkdir -p /usr/local/go/src/golang.org/x                                       #创建golang目录,或存放~/go/src/golang.org/x(有时会被墙所以手动)
cd /usr/local/go/src/golang.org/x											  #进入目录
git clone https://github.com/golang/mobile.git                                #克隆库
go build golang.org/x/mobile/cmd/gomobile                                     #编译 
go install golang.org/x/mobile/cmd/gomobile                                   #安装
gomobile init -v                          
gomobile version                                                              #验证
gomobile version +5704e18 Mon Jan 22 17:02:51 2018 +0000 (android); androidSDK=

```


* 创建frp工程

```
mkdir -p /usr/local/go/src/github.com/fatedier                                      #创建项目目录，或存放~/go/src/github.com/fatedier
wget https://github.com/fatedier/frp/archive/v0.21.0.tar.gz                         #拷贝0.13.0 frp源码
tar -xzvf v0.21.0.tar.gz -C /usr/local/go/src/github.com/fatedier/                  #解压至目录
cd /usr/local/go/src/github.com/fatedier/                                           #切换目录
mv frp-0.21.0 frp                                                                   #应环境更名
cd /usr/local/go/src/github.com/fatedier/frp/cmd/frpc                               #切换目录

```

* 编辑源文件(github.com/fatedier/frp/cmd/frpc/sub/root.go)

```
......

90 - err := runClient(cfgFile)
90 + err := RunClient(cfgFile)
......

172 - func runClient(cfgFilePath string) (err error) {
172 + func RunClient(cfgFilePath string) (err error) {

```

* 编辑源文件(github.com/fatedier/frp/cmd/frpc/main.go)

```
// Copyright 2016 fatedier, fatedier@gmail.com
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package frpclib

import (
	"github.com/fatedier/frp/cmd/frpc/sub"

	"github.com/fatedier/golib/crypto"
)

func main() {
	crypto.DefaultSalt = "frp"

	sub.Execute()
}

func Run(cfgFilePath string) {
	crypto.DefaultSalt = "frp"

	sub.RunClient(cfgFilePath)
}

```

* 编译库

```
gomobile bind -target=ios github.com/fatedier/frp/cmd/frpc                      #编译(不报错的情况)
ls
Frpclib.framework	main.go			sub
```
