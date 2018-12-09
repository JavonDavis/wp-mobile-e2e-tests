# frozen_string_literal: true
require 'bundler/setup'
require 'rake/testtask'
require 'parallel_appium'
require 'dotenv'

Dotenv.load

namespace :wordpress do
  desc 'Run tests'
  task :test, :file_path do |_t, _args|

    file_path = _args[:file_path]
    platform = ENV['platform']

    ParallelAppium::ParallelAppium.new.start platform: platform, file_path: file_path

    generate_report
  end

  def generate_report
    puts 'Loading History...'
    system 'rm -rf output/history'
    system 'cp -r wordpress-report/history output/report/'
    puts 'Loading environment properties....'
    system 'cp environment.properties output/report/'
    puts 'Loading categories.json....'
    system 'cp categories.json output/report/'
    puts 'Generating Report from...'

    system "allure generate output/report/ --clean -o wordpress-report"
  end

  desc 'Generate report'
  task :generate_report do |_t, _args|
    generate_report
  end

  desc 'Open report'
  task :report do |_t, _args|
    puts 'Opening Report...'
    system 'allure open wordpress-report'
  end

  desc 'Run bundle install'
  task :install do
    sh 'bundle install'
  end
end