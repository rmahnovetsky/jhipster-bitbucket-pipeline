FROM adoptopenjdk:11-jdk

RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs \
  && curl -L https://www.npmjs.com/install.sh | sh
RUN npm install -g grunt grunt-cli