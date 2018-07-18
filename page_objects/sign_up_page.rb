require_relative 'base_page'
require_relative '../locators/sign_up_page_locators'

# Page Object for SignUp Page
class SignUpPage < BasePage

  def initialize(driver, platform)
    @driver = driver
    @platform = platform
    @sign_up_locators = SignUpPageLocators.new.locators platform
  end

  def sign_up_label_text
    if @platform == 'ios'
      text_elements = @driver.find_elements @sign_up_locators[:sign_up_label]
      return text_elements[1].text
    end
    (@driver.find_element @sign_up_locators[:sign_up_label]).text
  end

  def on_sign_up_page?
    sign_up_text = 'To create your new WordPress.com account, please enter your email address.'
    sign_up_label_text == sign_up_text
  end
end