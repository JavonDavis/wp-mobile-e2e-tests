require_relative '../../page_objects/landing_page'

ParallelAppium::Server.new.set_udid_environment_variable

describe "#{ENV['platform']}: Login Page" do

  before(:each) do
    platform = caps[:platformName].to_sym
    driver = start_driver
    @landing_page = LandingPage.new driver, platform
  end

  it 'should successfully load landing page', ios: true, android: true do
    expect(@landing_page.is_on_landing_page).to equal true
  end
end