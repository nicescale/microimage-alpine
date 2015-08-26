![](https://discuss.csphere.cn/uploads/default/original/2X/9/9f0507b1695ef97e21a54baf2aaf1a652de678b9.png)

## 如何使用该镜像

    docker pull csphere/alpine:3.2

## 快速开始

    docker run -it csphere/alpine:3.2 sh

## 基于`csphere/alpine`镜像,构建其他镜像

Dockefile内容：

```
from csphere/alpine:3.2
run apk add --update nginx
...其他命令
```
执行构建命令

    docker build -t csphere/nginx .
