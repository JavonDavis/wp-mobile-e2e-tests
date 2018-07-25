require_relative 'base_page'
require_relative '../locators/signup_locators'

# Page object for signup page
class SignupPage < BasePage

  def initialize(driver, platform)
    @driver = driver
    @platform = platform
    @locators = SignupLocators.new.locators platform
  end

  def on_signup_page?
    explicitly_wait_for_presence @locators[:title_label]
  end
end