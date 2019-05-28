FROM openjdk:8-jdk-stretch

RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs \
  && curl -L https://www.npmjs.com/install.sh | sh
RUN npm install -g grunt grunt-cli