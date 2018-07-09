require_relative 'base_page'
require_relative '../locators/landing_page_locators'

class LandingPage < BasePage

  def initialize(driver, platform)
    @driver = driver
    @platform = platform
    @landing_locators = LandingPageLocators.new.locators platform
  end

  # Checks if the screen is on the login page
  # @return [Boolean] True if on the landing page, false otherwise
  def is_on_landing_page
    explicitly_wait_for_presence @landing_locators[:login_button]
  end

  # @return [String] the text contained in the promo label, nil otherwise
  def promo_label_text
    unless is_on_landing_page
      nil
    end
    unless explicitly_wait_for_presence @landing_locators[:promo_label]
      nil
    end

    if @platform == :android
      promo_label_element = @driver.find_element @landing_locators[:promo_label]
    elsif @platform == :ios
      promo_label_elements = @driver.find_elements @landing_locators[:promo_label]
      promo_label_element = promo_label_elements[1] # First element is the time
    else
      puts 'Unknown platform when checking promo label text'
      return nil
    end
    promo_label_element.text
  end

  # Swipes the promo label in the specified direction, this is used to switch the card
  # @param [Symbol] direction, , `:left`, `:right`, `:up`, or `:down`
  # @return [Boolean] true if it was able to swipe, false otherwise
  def swipe_promo_label(direction = :left)
    unless explicitly_wait_for_presence @landing_locators[:promo_label]
      false
    end
    promo_label_element = @driver.find_element @landing_locators[:promo_label]
    swipe promo_label_element, direction
  end
end