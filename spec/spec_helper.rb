require 'rspec'
require 'allure-rspec'
require 'parallel_appium'

require_relative '../common/common'
require_relative '../common/allure_common'

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.include AllureRSpec::Adaptor

  config.before :all do
    puts "Initializing Appium for #{ENV['platform']}"
    @driver = ParallelAppium::ParallelAppium.new.initialize_appium platform: ENV['platform']
  end

  config.before :each do
    if ENV['platform'] == 'android'
      helper.start_logcat ENV['UDID']
    end
    helper.start_video_record ENV['UDID']
  end

  config.after :each do |e|
    if ENV['platform'] == 'android'
      helper.stop_logcat
    end
    helper.stop_video_record ENV['UDID']
    attach_report_files @driver, e
    helper.clean_output_folder

  end

  config.after :all do
    @driver.driver_quit
  end
end

allure_setup