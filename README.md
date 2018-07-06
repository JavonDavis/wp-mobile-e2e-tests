# Wordpress-Open-Source-Automation
Automating the wordpress open source native mobile apps using Appium and SeleniumGrid


## Build android app 

./gradlew assembleVanillaDebug


## Build iOS app 

xcodebuild -workspace WordPress.xcworkspace -scheme WordPress -configuration “Debug” -sdk iphonesimulator11.4


## Install dependencies

bundle install --path vendor


* Location defaults to spec/ if file path not passed as parameter