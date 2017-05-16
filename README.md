# Docker镜像

以下所有镜像在官方源的基础上创建，使用的资源来自公网，因此可以在自己的环境下创建。

包括以下镜像的制作和使用说明：

- CentOS 7.2.1511
- JDK
- Logstash

所有镜像已同步到时速云，可以直接使用。

```
index.tenxcloud.com/jimmy/centos:7.2.1511
index.tenxcloud.com/jimmy/jdk:6u25
index.tenxcloud.com/jimmy/jdk:7u80
index.tenxcloud.com/jimmy/jdk:8u45
index.tenxcloud.com/jimmy/logstash:5.3.0
```

## CentOS 7.2.1511

### 特性

该镜像基于`centos:7.2.1511`官方镜像构建。

镜像地址：index.tenxcloud.com/jimmy/centos:7.2.1511

该官方镜像的基础上进行了如下改进：

- 修改时区为东八区北京时间
- 安装Supervisor
- 设置了ulimit为65535
- 可以添加centos repo
- 安装了vim、tar、net-tools等实用工具

**使用方式**

默认使用Supervisord作为容器启动入口，如果你后台启动不指定参数的话会只启动supervisord进程。

支持同时后台启动多个应用，只需要安装好应用，在`etc/services-config/supervisor/supervisord.d`目录下增加后缀名为`.conf`或`.ini`的配置文件即可。

可以作为所有其他镜像的基础镜像。

## JDK

在刚构建的`centos:7.2.1511`的基础上创建，JDK是直接从Oracle官网上下载rpm安装包安装。

包括以下Oracle JDK版本：

- jdk6u25
- jdk7u80
- jdk8u45

**使用方式**

JAVA_HOME=/usr/java/default

可以作为所有依赖JDK服务的基础镜像使用。

## Logstash

基于**Logstash5.3.0**官方安装包制作。

**使用方式**

修改以下环境变量

```
# 收集的日志文件位置，可以使用通配符
ENV LogFile /var/log/yum.log
# 日志格式
ENV CODEC plain
# ES服务器地址
ENV ES_SERVER 172.21.14.5:9200
# 索引名称
ENV INDICES xg-docker
```

**注意**

LogFile支持通配符，单个目录和列表。

- `-e LogFile='"/logs/*.log"'`
- `-e LogFile='["/logs/*.log","/var/log/lastlog"]'`

### 镜像制作

进入到各个子目录中，修改`Makefile`中的镜像仓库地址为你自己的镜像仓库地址。

```
make all
```
## 链接

[Jimmy Song](http://rootsongjc.github.io/about)

[Kubernetes-handbook](https://github.com/rootsongjc/kubernetes-handbook)
