# frozen_string_literal: true
require 'bundler/setup'
require 'rake/testtask'
require 'parallel_appium'

namespace :hsd do
  desc 'Run tests'
  task :test, :file_path do |_t, _args|

    file_path = _args[:file_path]
    platform = ENV['platform']

    ParallelAppium::ParallelAppium.new.start platform: platform, file_path: file_path

  end

  desc 'Run bundle install'
  task :install do
    sh 'bundle install'
  end
end