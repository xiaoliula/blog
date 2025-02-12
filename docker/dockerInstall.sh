#!/bin/bash
# Copyright (c) poetize.cn. All rights reserved.
# 习近平：全面加强知识产权保护工作 激发创新活力推动构建新发展格局
# 项目开源版本使用AGPL v3协议，商业活动除非获得商业授权，否则无论以何种方式修改或者使用代码，都需要开源。地址：https://gitee.com/littledokey/poetize.git
# 开源不等于免费，请尊重作者劳动成果。
# 项目闭源版本及资料禁止任何未获得商业授权的网络传播和商业活动。地址：https://poetize.cn/article/20
# 项目唯一官网：https://poetize.cn

install_docker_centos() {
    curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
    systemctl start docker
    systemctl enable docker
}

install_docker_ubuntu() {
    curl -fsSL https://test.docker.com -o test-docker.sh
    sh test-docker.sh
    systemctl start docker
    systemctl enable docker
}

install_docker_debian() {
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    systemctl start docker
    systemctl enable docker
}

install_docker_compose_centos() {
    curl -L "https://github.com/docker/compose/releases/download/2.27.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
}

install_docker_compose_ubuntu() {
    curl -L "https://github.com/docker/compose/releases/download/2.27.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
}

install_docker_compose_debian() {
    curl -L "https://github.com/docker/compose/releases/download/2.27.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
}

cp_docker_compose() {
    cp -i /home/poetize/docker/docker-compose /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
}

create_symbolic_link() {
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
}

echo "开始执行 Docker 安装"

if ! command -v docker &>/dev/null; then
    echo "Docker 未安装，开始执行安装程序"

    if [ -f /etc/centos-release ]; then
        echo "识别系统：CentOS"
        install_docker_centos

    elif [ -f /etc/lsb-release ]; then
        echo "识别系统：Ubuntu"
        install_docker_ubuntu

    elif [ -f /etc/debian_version ]; then
        echo "识别系统：Debian"
        install_docker_debian

    else
        echo "未知Linux系统，安装失败"
        exit 1
    fi

    echo "Docker 安装成功"
else
    echo "Docker 已安装，无需执行安装程序"
fi

if ! command -v docker-compose &>/dev/null; then
    echo "Docker Compose 未安装，开始执行安装程序"

    cp_docker_compose

    create_symbolic_link

    echo "Docker Compose 安装成功"
else
    echo "Docker Compose 已安装，无需执行安装程序"
fi

echo "---------------"

echo "开始执行 POETIZE 安装"

cd /home/poetize/docker

docker-compose up -d

echo "POETIZE 安装完成"
