FROM ubuntu:16.04

LABEL maintainer "Orandi Harris <idnarosirrah@gmail.com>"

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

#================

# Set Working directory

#================

WORKDIR /home

#==============
# GENERAL PACKAGES NEEDED

# openjdk-8-jdk JAVA

# Node

# Appium

# Android

# curl

# wget

# ruby

# zip to make a zip files

# tzdata for timezone

# unzip to unzip zip files

# ca-certificates

#==============

RUN apt-get update && \
      apt-get -y install sudo


RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install \
    openjdk-8-jdk \
    ca-certificates \
    tzdata \
    git-core \
    zip \
    unzip \
    curl \
    wget \
    xvfb \
  && rm -rf /var/lib/apt/lists/*

#===============
# Set JAVA_HOME
#===============
ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre" \
    PATH=$PATH:$JAVA_HOME/bin

#=====================
# Install Android SDK
#=====================
ENV ANDROID_HOME /opt/android
ENV AVD_VERSION 26
RUN wget -O android-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip --show-progress \
&& unzip android-tools.zip -d $ANDROID_HOME && rm android-tools.zip

ENV PATH $PATH:$ANDROID_HOME/tools/bin

# Add android tools and platform tools to PATH
ENV ANDROID_HOME /usr/local/android-sdk
ENV PATH $PATH:$ANDROID_HOME/tools

RUN mkdir -p ~/.android && \
    touch ~/.android/repositories.cfg

#Install Android Tools
RUN yes | sdkmanager --update --verbose
RUN yes | sdkmanager "platform-tools" --verbose
RUN yes | sdkmanager "platforms;android-26" --verbose
RUN yes | sdkmanager "build-tools;26.0.2" --verbose
RUN yes | sdkmanager "emulator"
RUN sdkmanager --update

# Add platform-tools and emulator to path
ENV PATH $PATH:$ANDROID_HOME/platform-tools
ENV PATH $PATH:$ANDROID_HOME/emulator

#Install latest android emulator system images
ENV EMULATOR_IMAGE "system-images;android-26;google_apis;x86_64"
RUN yes | sdkmanager $EMULATOR_IMAGE --verbose

# Copy Qt library files to system folder
RUN cp -a /opt/android/emulator/lib64/qt/lib/. /usr/lib/x86_64-linux-gnu/

RUN android create avd --force --name android-$AVD_VERSION --target android-$AVD_VERSION \
  --device "Nexus S" --abi armeabi-v7a --skin WVGA800


#==========================
# Install Appium Dependencies
#==========================

ARG APPIUM_VERSION=1.8.1
ENV APPIUM_VERSION=$APPIUM_VERSION

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
  && apt-get -qqy install \
    nodejs \
    python \
    make \
    build-essential \
    g++ 

#========================
# Install Ruby here
#=======================
# install RVM, Ruby, and Bundler
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN \curl -sSL https://get.rvm.io | bash -s stable --ruby
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && rvm install 2.4.1"
RUN /bin/bash -l -c "gem install bundler"

ENV PATH=$PATH:/home/.rvm/bin

#=====================
# Install Appium
#=====================
ENV APPIUM_VERSION 1.8.1

RUN mkdir /opt/appium \
  && cd /opt/appium \
  && npm install appium@$APPIUM_VERSION \
  && ln -s /opt/appium/node_modules/.bin/appium /usr/bin/appium

EXPOSE 4723


COPY Gemfile /home
COPY Gemfile.lock /home

RUN /bin/bash -l -c "bundle install --path vendor"

COPY . /home

RUN ["chmod", "+x", "./scripts/run_integration_test.sh"]

# Run following script on docker run
ENTRYPOINT ["./scripts/run_integration_test.sh","-l", "-c"]




