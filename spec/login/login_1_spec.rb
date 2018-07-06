require 'rspec'

ParallelAppium::Server.new.set_udid_environment_variable

describe "#{ENV['platform']}: Login Page" do

  before(:each) do
    puts 'Before Each'
    puts "Driver is nil #{@driver.nil?} and udid is #{ENV['UDID']}"
    driver = @driver.start_driver
  end

  it 'should should login successfully with correct email and password', ios: true, android: true do
    sleep 15
    expect(true).to equal false
  end
end