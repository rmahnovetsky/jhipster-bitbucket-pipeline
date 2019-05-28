FROM atlassian/default-image:latest

RUN \

  # Install OpenJDK-8
	apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
	apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;


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
  wget https://nodejs.org/dist/v6.9.0/node-v6.9.0.tar.gz && \
  tar -zxvf node-v6.9.0.tar.gz && cd node-v6.9.0 && \
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

  # make it possible to run bower with root
  echo '{ "allow_root": true }' > /root/.bowerrc

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
#RUN export JAVA_HOME
CMD ["bash"]

