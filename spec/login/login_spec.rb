require 'config'

require_relative '../../page_objects/landing_page'
require_relative '../../page_objects/login_page'
require_relative '../../common/common'

ParallelAppium::Server.new.set_udid_environment_variable

describe "#{ENV['platform']}: Login Page Group #1" do

  before(:each) do
    @platform = caps[:platformName].to_sym
    @driver = start_driver
    @landing_page = LandingPage.new @driver, @platform
    @login_page = LoginPage.new @driver, @platform
  end

  it 'should allow users to login with valid email and password', ios: true, android: true do |t|
    t.step 'Check that landing page loaded' do
      expect(@landing_page.on_landing_page?).to equal true
    end

    t.step 'Click login page' do
      @landing_page.click_login_button
    end

    account = Settings.testAccounts.defaultUser

    t.step 'Check for config variables with email and password credentials' do
      expect(account.email).to_not be nil
      expect(account.password).to_not be nil
    end

    email = account.email.to_s
    password = account.password.to_s

    t.step "Attempt to login with #{email} and password: #{password}" do
      @login_page.enter_email email
      @login_page.enter_password password
      login_result = @login_page.attempt_login
      expect(login_result).to be true
    end
  end


  it 'should not allow users to login with valid email and invalid password', ios: true, android:true do |t|
    t.step 'Check that landing page loaded' do
      expect(@landing_page.on_landing_page?).to equal true
    end

    t.step 'Click login page' do
      @landing_page.click_login_button
    end

    account = Settings.testAccounts.defaultUser

    # Let's assume the user's password is Password
    email = account.email.to_s
    password = "Password"

    t.step "Attempt to login with #{email} and password: #{password}" do
      @login_page.enter_email email
      @login_page.enter_password password
      login_result = @login_page.attempt_login
      expect(login_result).to be false
    end

  end
end