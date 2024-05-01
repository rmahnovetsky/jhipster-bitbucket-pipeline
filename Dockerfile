FROM adoptopenjdk:11-jdk

# fix  Tracker "idealTree" already exists on npm inst
WORKDIR /usr/app
COPY ./ /usr/app

# node, npm
RUN apt-get install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
RUN curl -L https://www.npmjs.com/install.sh | sh
RUN npm install -g grunt grunt-cli

# for aws cli
RUN apt-get update && \
    apt-get install -y \
        python3 \
        python3-pip \
        python3-setuptools \
        python3-dev \
        python3-virtualenv \
        python3-venv \
        python3-wheel \
        virtualenv \
        groff \
        less \
        docker-compose \
    && pip3 install --upgrade pip \
    && apt-get clean
RUN pip3 --no-cache-dir install --upgrade awscli

# git
RUN apt-get -y install git
