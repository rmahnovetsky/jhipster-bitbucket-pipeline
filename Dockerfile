FROM atlassian/default-image:latest

RUN \

  # install JDK 8
  sudo apt-get install --reinstall ca-certificates && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer && \

  # install utilities
  apt-get install -y \
     wget \
     curl \
     git \
     bzip2 \
     fontconfig \
     python \
     g++ \
     build-essential &&\

  # install node
  wget https://nodejs.org/dist/v5.6.0/node-v5.6.0.tar.gz && \
  tar -zxvf node-v5.6.0.tar.gz && cd node-v5.6.0 && \
  ./configure && \
   make && \
   make install && \

  # upgrade npm
  npm install -g npm && \

  # install yeoman bower gulp
  npm install -g \
    yo \
    bower \
    gulp-cli && \

  # cleanup
  apt-get clean && \
  rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* && \

  # make it possible to bower with root
  echo '{ "allow_root": true }' > /root/.bowerrc

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
CMD ["bash"]
