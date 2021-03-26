FROM ubuntu:20.04

ENV container docker

COPY overlay/etc/apt/sources.list /etc/apt/
RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive \
        apt-get install -y --no-install-recommends \
            systemd php7.4 php7.4-fpm php7.4-mysql nginx mysql-server
COPY overlay/ /
RUN mysqld --console --init-file=/data/init.sql --socket=/tmp/mysql.sock & \
    sleep 5 && \
    cat /var/log/mysql/error.log && \
    pkill mysqld
RUN systemctl enable php7.4-fpm && \
    systemctl enable mysql && \
    systemctl enable nginx &&
    systemctl mask console-getty && \
    systemctl mask systemd-logind && \
    systemctl mask systemd-vconsole-setup

STOPSIGNAL 37
CMD [ "/bin/systemd" ]
