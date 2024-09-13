# mget

自动对github.com 的wget指令的url增加前缀

如

`wget https://github.com/hunshcn/gh-proxy/archive/refs/heads/master.zip`

将自动拼接为

`wget $GITHUB_MIRROR/https://github.com/hunshcn/gh-proxy/archive/refs/heads/master.zip`

使用前请设置`GITHUB_MIRROR`环境变量

## 安装

将本项目clone后。

`$ GITHUB_MIRROR=可用的github镜像`

`$ source /your repo path/mget.sh`


