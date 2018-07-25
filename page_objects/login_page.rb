require_relative 'base_page'
require_relative '../locators/login_page_locators'

# Page object for the login page
class LoginPage < BasePage

  def initialize(driver, platform)
    @driver = driver
    @platform = platform
    @locators = LoginPageLocators.new.locators platform
  end

  # Checks if the screen is on the login page
  # @return [Boolean] True if on the login page, false otherwise
  def on_login_page?
    true
  end


end