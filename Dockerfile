FROM adoptopenjdk:11-jdk

# fix  Tracker "idealTree" already exists on npm inst
WORKDIR /usr/app
COPY ./ /usr/app

# node, npm
RUN apt-get install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs
RUN curl -L https://www.npmjs.com/install.sh | sh
RUN npm install -g grunt grunt-cli

#  python
RUN apt update
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update
RUN apt install python3.12 python3.12-venv python3.12-dev -y
RUN apt install jq -y
RUN python3.12 -m ensurepip --upgrade
RUN pip3.12 install --upgrade pip setuptools wheel
RUN pip3.12 install six==1.16.0

# Install Docker CLI
RUN apt-get update && apt-get install -y docker.io

RUN apt-get update && apt-get install -y docker.io

# Install Docker Compose V2 plugin (from https://docs.docker.com/compose/install/linux/)
ENV DOCKER_CONFIG=${DOCKER_CONFIG:-/root/.docker}
RUN mkdir -p $DOCKER_CONFIG/cli-plugins \
    && curl -SL https://github.com/docker/compose/releases/download/v2.36.0/docker-compose-linux-$(uname -m) -o $DOCKER_CONFIG/cli-plugins/docker-compose \
    && chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

# awscli
RUN apt-get clean
RUN pip3.12 --no-cache-dir install --upgrade awscli

# git
RUN apt-get -y install git
