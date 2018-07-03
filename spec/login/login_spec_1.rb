require 'rspec'

ParallelAppium::Server.new.set_udid_environment_variable

describe "#{ENV[platform]}: Login Page" do

  before(:each) do
    driver = start_driver
    platform = caps[:platformName].to_sym
  end

  it 'should should login successfully with correct email and password', ios: true, android: true do

    true.should == false
  end
end