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
    explicitly_wait_for_presence @locators[:email_field]
  end

  def enter_email(email)
    email_field_element = @driver.find_element @locators[:email_field]
    email_field_element.send_keys email

    wait_then_click @locators[:next_button]
  end

  def enter_password(password)
    wait_then_click @locators[:enter_password_button]
    password_field_element = @driver.find_element @locators[:password_field]
    password_field_element.send_keys password
  end

  def attempt_login
    wait_then_click @locators[:log_in_button]
    error_label_present = explicitly_wait_for_presence @locators[:error_label]
    password_field_pr = explicitly_wait_for_presence @locators[:password_field]
    (!error_label_present) && (!password_field_pr)
  end

end