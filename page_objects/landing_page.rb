require_relative 'base_page'
require_relative '../locators/landing_page_locators'

class LandingPage < BasePage

  def initialize(driver, platform)
    @driver = driver
    @platform = platform
    @landing_locators = LandingPageLocators.new.locators platform
  end

  def is_on_landing_page
    explicitly_wait_for_presence @landing_locators[:login_button]
  end

  def promo_label_locator(promo_text)
    target_data = @landing_locators[:promo_label]
    by = target_data.keys[0]
    locator = target_data[by.to_sym]

    locator = locator % promo_text
    [by, locator]
  end

  def promo_label_exists(promo_text)
    explicitly_wait_for_presence(promo_label_locator promo_text)
  end

  def swipe_promo_label(promo_text, left=true)
    unless promo_label_exists(promo_text)
      false
    end

    promo_label_element = @driver.find_element(promo_label_locator promo_text)

  end
end