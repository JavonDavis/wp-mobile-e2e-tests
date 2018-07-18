require_relative 'base_page'
require_relative '../locators/login_page_locators'

# Page object for the Login Screen
class LoginPage < BasePage

  def initialize(driver, platform)
    @driver = driver
    @platform = platform
    @login_locators = LoginPageLocators.new.locators platform
  end

  def login_label_text
    if @platform == 'ios'
      text_elements = @driver.find_elements @login_locators[:login_label]
      return text_elements[1].text
    end
    (@driver.find_element @login_locators[:login_label]).text
  end

  def on_login_page?
    login_text = 'Log in to WordPress.com using an email address to manage all your WordPress sites.'
    label_text = login_label_text
    label_text == login_text
  end

end