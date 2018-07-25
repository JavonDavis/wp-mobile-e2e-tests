require_relative '../../page_objects/landing_page'
require_relative '../../page_objects/login_page'
require_relative '../../common/common'

ParallelAppium::Server.new.set_udid_environment_variable

describe "#{ENV['platform']}: Login Page" do

  before(:all) do
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

    email = ENV['email']
    password = ENV['password']

    t.step 'Check for environment variables with email and password credentials' do
      expect(email).to_not be nil
      expect(password).to_not be nil
    end

    email = email.to_s
    password = password.to_s

    t.step "Attempt to login with #{email} and password: #{password}" do
      login_result = @login_page.attempt_login(email, password)
      expect(login_result).to be true
    end
  end


  it 'should allow users to navigate to sign up via email page', ios: true, android:true do |t|
    t.step 'Check that landing page loaded' do
      expect(@landing_page.on_landing_page?).to equal true
    end

    t.step 'Click login page' do
      @landing_page.click_login_button
    end

    email = ENV['email']
    password = ENV['password']

    t.step 'Check for environment variables with email and password credentials' do
      expect(email).to_not be nil
      expect(password).to_not be nil
    end

    # let's assume this user does not exist
    email = 'abc@abc.com'
    password = 'password'

    t.step "Attempt to login with #{email} and password: #{password}" do
      login_result = @login_page.attempt_login(email, password)
      expect(login_result).to be false
    end

  end
end