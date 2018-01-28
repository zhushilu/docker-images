# =============================================================================
#
# CentOS-7 7.2.1511 x86_64 - Supervisor
# 
# =============================================================================
FROM centos:7.2.1511

MAINTAINER  <zhushilu03@gmail.com>

# -----------------------------------------------------------------------------
# Import the Repositories
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Base Install
# -----------------------------------------------------------------------------
RUN  yum -y install \
#	vim \
        tar \
        net-tools \
	&& rm -rf /var/cache/yum/* \
	&& yum clean all

# -----------------------------------------------------------------------------
# CTC Timezone & Networking
# -----------------------------------------------------------------------------
RUN ln -sf \
		/usr/share/zoneinfo/Asia/Shanghai \
		/etc/localtime \
	&& echo "NETWORKING=yes" > /etc/sysconfig/network

# -----------------------------------------------------------------------------
# Copy files into place
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
RUN rm -rf /etc/ld.so.cache \
	; rm -rf /sbin/sln \
	; rm -rf /usr/{{lib,share}/locale,share/{man,doc,info,cracklib,i18n},{lib,lib64}/gconv,bin/localedef,sbin/build-locale-archive} \
	; rm -rf /{root,tmp,var/cache/{ldconfig,yum}}/* \
	; > /etc/sysconfig/i18n

# -----------------------------------------------------------------------------
# Ulimit
RUN echo "* soft nofile 655350" >> /etc/security/limits.conf & \
echo "* hard nofile 655350" >> /etc/security/limits.conf & \
echo "@root        soft    nproc           655350" >> /etc/security/limits.conf & \
echo "@root        hard    nproc           655350" >> /etc/security/limits.conf & \
echo "ulimit -SH 655350" >> /etc/rc.local
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Set default environment variables
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Set image metadata
# -----------------------------------------------------------------------------
ARG RELEASE_VERSION="1.0.0"
LABEL \
        description="CentOS-7 7.2.1511 x86_64 - Supervisor /" \
        vendor="CentOS"
