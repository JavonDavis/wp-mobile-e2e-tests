# Wordpress-Open-Source-Automation
Automating the wordpress open source native mobile apps using Appium and SeleniumGrid


## Build android app 

./gradlew assembleVanillaDebug


## Build iOS app 

xcodebuild -workspace WordPress.xcworkspace -scheme WordPress -configuration “Debug” -sdk iphonesimulator11.4


## Install dependencies

bundle install --path vendor


* Location defaults to spec/ if file path not passed as parameter
* Add variables to path


[//]: # (export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer
export ANDROID_HOME=/Users/javondavis-qw/Library/Android/sdk
export ANDROID_AVD_HOME=~/.android/avd
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
export JAVA_HOME=$\(/usr/libexec/java_home\) Remove \
export PATH=${JAVA_HOME}/bin:$PATH
export PATH=$ANDROID_HOME/emulator:$PATH)