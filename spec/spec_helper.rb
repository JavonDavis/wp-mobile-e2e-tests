require 'rspec'
require 'allure-rspec'
require 'parallel_appium'

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.include AllureRSpec::Adaptor

  config.before :all do
    puts "Initializing Appium for #{ENV['platform']}"
    @driver = ParallelAppium::ParallelAppium.new.initialize_appium platform: ENV['platform']
  end

  config.after :all do
    @driver.driver_quit
  end
end
