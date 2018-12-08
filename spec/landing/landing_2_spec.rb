require_relative '../../page_objects/landing_page'
require_relative '../../page_objects/login_page'
require_relative '../../page_objects/signup_page'
require_relative '../../common/common'

ParallelAppium::Server.new.set_udid_environment_variable

describe "#{ENV['platform']}: Landing Page Group #2" do

  before(:each) do
    @platform = caps[:platformName].to_sym
    @driver = start_driver
    @landing_page = LandingPage.new @driver, @platform
    @login_page = LoginPage.new @driver, @platform
    @signup_page = SignupPage.new @driver, @platform
  end

  it 'should allow users to navigate to Login Page from the login button', ios: true, android: true do |t|
    t.step 'Check that landing page loaded' do
      expect(@landing_page.on_landing_page?).to equal true
    end

    t.step 'Click login page' do
      @landing_page.click_login_button
    end

    t.step 'Check that we\'re on the login page' do
      expect(@login_page.on_login_page?).to be true
    end
  end


  it 'should allow users to navigate to sign up via email page', ios: true, android:true do |t|
    t.step 'Check that landing page loaded' do
      expect(@landing_page.on_landing_page?).to equal true
    end

    t.step 'Click sign up button' do
      expect(@landing_page.click_sign_up_button).to be true
    end

    t.step 'Click sign up via email' do
      expect(@landing_page.click_sign_up_via_email_button).to be true
    end

    t.step 'Check that we\'re on the sign up page' do
      expect(@signup_page.on_signup_page?).to be true
    end
  end
end