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

# awscli
RUN apt-get clean
RUN pip3.12 --no-cache-dir install --upgrade awscli

# git
RUN apt-get -y install git
