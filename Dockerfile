FROM adoptopenjdk:11-jdk

# node, npm
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs \
  && curl -L https://www.npmjs.com/install.sh | sh
RUN npm install -g grunt grunt-cli

# for aws cli
RUN apt-get update && \
    apt-get install -y \
        python3 \
        python3-pip \
        python3-setuptools \
        groff \
        less \
    && pip3 install --upgrade pip \
    && apt-get clean
RUN pip3 --no-cache-dir install --upgrade awscli

# git
RUN apt-get -y install git

# ansible
RUN pip3 install ansible