#!/bin/bash

apt-get update -qq
apt-get upgrade -qq -y

# Install packages
apt-get install -qq -y nginx expect

# expect Setting
timeout=10
force="y"

# Setting up Docker & Docker-Compose
apt-get install -qq -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list | /dev/null

apt-get update -qq
apt-get install -qq -y docker-ce docker-ce-cli containerd.io
usermod -aG docker ${USER}

mkdir -p /usr/local/libexec/docker/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.8.0/docker-compose-linux-x86_64 -o /usr/local/libexec/docker/cli-plugins/docker-compose

chmod +x /usr/local/libexec/docker/cli-plugins/docker-compose

# Setting up Firewall
expect -c "
    set timeout $timeout
    spawn ufw enable
    expect \"Command may disrupt existing ssh connections. Proceed with operation (y|n)?\"
    send \"$force\n\"
    expect \"Firewall is active and enabled on system startup\"
    exit 0
"

PORTS=(22 80 443)
iSSSH=true
for PORT in "${PORTS[@]}"; do
    if "${iSSSH}"; then
        ISSH=false
        echo "Setting up Firewall for port ${PORT}"
        ufw limit ${PORT}/tcp
    else
        echo "Setting up Firewall for port ${PORT}"
        ufw allow ${PORT}/tcp
    fi
done