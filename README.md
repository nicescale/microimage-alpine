![alpine](https://csphere.cn/assets/c7a87396-7b8a-4c62-ac99-65c2a38124f2)

## 如何使用该镜像

    $ docker pull csphere/alpine:3.2

## 快速开始

    $ docker run -it csphere/alpine:3.2 sh

## 基于`csphere/alpine`镜像,构建其他镜像

Dockefile内容：

```Dockerfile
from csphere/alpine:3.2
run apk add --update nginx
...其他命令
```

执行构建命令:

    $ docker build -t csphere/nginx .

## 授权和法律

该镜像由希云制造，未经允许，任何第三方企业和个人，不得重新分发。违者必究。

## 支持和反馈

该镜像由希云为企业客户提供技术支持和保障，任何问题都可以直接反馈到: `docker@csphere.cn`
