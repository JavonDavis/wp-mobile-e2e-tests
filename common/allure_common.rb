require 'allure-rspec'
require 'appium_lib'
require 'parallel'
require 'parallel_tests'
require_relative './common'

def attach_report_files(driver, example)
  # Generate additional report data
  hub_filename = "#{ENV['BASE_DIR']}/output/hub.log"
  if File.file?(hub_filename)
    example.attach_file("Hub Log: #{ENV['UDID']}.txt", File.new(hub_filename)) unless (ENV['THREADS'].nil? or ENV['THREADS'] == 1)
  end

  log_filename = "#{ENV['BASE_DIR']}/output/#{ENV['platform']}.log"

  if File.file?(log_filename)
    example.attach_file("WordPress Log: #{ENV['UDID']}.txt", File.new(log_filename))
  end

  helper.take_screenshot driver
  # Move images into report folder
  files = `ls ./output/*#{ENV['UDID']}*`.split("\n").map { |file| { name: file.match(/output\/(.*)-/)[1], file: file } }
  files.each { |file| example.attach_file(file[:name], File.new(file[:file])) } unless files.empty?
end

def allure_setup
  AllureRSpec.configure do |c|
    c.output_dir = "#{ENV['BASE_DIR']}/output/report/" # TODO: Cache older reports before cleaning the directory
    c.clean_dir = true
  end
  ParallelTests.first_process? ? FileUtils.rm_rf(AllureRSpec::Config.output_dir) : sleep(1)
end