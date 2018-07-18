require_relative '../../page_objects/landing_page'
require_relative '../../page_objects/login_page'
require_relative '../../page_objects/sign_up_page'
require_relative '../../common/common'

ParallelAppium::Server.new.set_udid_environment_variable

describe "#{ENV['platform']}: Landing Page" do

  before(:all) do
    @platform = caps[:platformName].to_sym
    @driver = start_driver
    @landing_page = LandingPage.new driver, @platform
    @login_page = LoginPage.new driver, @platform
    @sign_up_page = SignUpPage.new driver, @platform
  end

  it 'should should allow users to access login page', ios: true, android: true do |t|

    t.step 'Check that landing page loaded' do
      expect(@landing_page.on_landing_page?).to equal true
    end
    helper.take_screenshot @driver

    t.step 'Check that login button is present' do
      expect(@landing_page.login_button_visible?).to equal true
    end
    helper.take_screenshot @driver

    t.step 'Check that clicking the login button takes user to login page' do
      @landing_page.click_login_button

      expect(@login_page.on_login_page?).to equal true
    end
    helper.take_screenshot @driver
  end

  it 'should should allow users to access sign up page', ios: true, android:true do |t|

    t.step 'Check that landing page loaded' do
      expect(@landing_page.on_landing_page?).to equal true
    end
    helper.take_screenshot @driver

    t.step 'Check that sign up button is present' do
      expect(@landing_page.sign_up_button_visible?).to equal true
    end
    helper.take_screenshot @driver

    t.step 'Check that clicking the sign up button opens options' do
      @landing_page.click_sign_up_button

      expect(@landing_page.sign_up_options_visible?).to equal true
    end
    helper.take_screenshot @driver

    t.step 'Choose email option and validate sign up page opens' do
      @landing_page.click_sign_up_with_email_button

      expect(@sign_up_page.on_sign_up_page?).to equal true
    end
    helper.take_screenshot @driver
  end
end