# Wordpress Mobile Automation

[//]: # (Image References)
[automationgif]: ./readme/automation_sample.gif
[automationgif1]: ./readme/automation_sample1.gif

[![CircleCI](https://circleci.com/gh/JavonDavis/Wordpress-Open-Source-Automation-Ruby/tree/master.svg?style=svg)](https://circleci.com/gh/JavonDavis/Wordpress-Open-Source-Automation-Ruby/tree/master)

This project demonstrates mobile app automated testing using the [parallel_appium gem](https://github.com/JavonDavis/parallel_appium) to do a lot of the heavy lifting. The 
project demos the basics of testing with Appium and Ruby, shows some advanced techniques and through the gem uses SeleniumGrid
to distribute tests across devices and execute tests in parallel.

![Automation Gif][automationgif]

![Automation Gif][automationgif1]

## Getting setup

First let's get the apps we'll be automating. 
The app we'll be automating is the Wordpress mobile app which is open source and free to use and is a pretty great app
 overall and beat all the other options I think for a demo app, kudos to the team over at Wordpress. The builds tested with this project I've made publicly available to download below,

* [Android](https://drive.google.com/file/d/1Hb2z7guNc8ch1o11mmuP5aioJ_Endal3/view?usp=sharing)
* [iOS](https://drive.google.com/file/d/18ODObtGuG3UYhgst-6h6ucn79_kYTxwD/view?usp=sharing)

If you'd like to build the apps yourself you can visit the wordpress-mobile github pages and build the app from source via the following commands
for Android and iOS. 


## [Building android app](https://github.com/wordpress-mobile/WordPress-Android) 

Executing the following command will build an unsigned version of the Android app that can be used, 

```./gradlew assembleVanillaDebug```


## [Building iOS app](https://github.com/wordpress-mobile/WordPress-iOS) 

From the project root you'll need to execute the following command with the correct sdk based on the XCode version on your machine, currently mine is 9.4,

```xcodebuild -workspace WordPress.xcworkspace -scheme WordPress -configuration “Debug” -sdk iphonesimulator11.4```


Next you'll need to install the dependencies to run the app. That's a pretty simple step

## Install dependencies

```bundle install --path vendor```

Also the [parallel_appium gem](https://github.com/JavonDavis/parallel_appium) covers a lot of bases including starting the appium server

[//]: # (export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer
export ANDROID_HOME=/Users/javondavis-qw/Library/Android/sdk
export ANDROID_AVD_HOME=~/.android/avd
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
export JAVA_HOME=$\(/usr/libexec/java_home\) Remove \
export PATH=${JAVA_HOME}/bin:$PATH
export PATH=$ANDROID_HOME/emulator:$PATH)

This software is provided "as is" and without any express or implied warranties, including, without limitation, 
the implied warranties of merchantibility and fitness for a particular purpose.
