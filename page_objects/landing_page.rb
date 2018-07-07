require_relative 'base_page'
require_relative '../locators/landing_page_locators'

class LandingPage < BasePage

  # Promotion texts for cards
  promo_texts = [
      'Publish from the park. Blog from the bus. Comment from the café. WordPress goes where you go.',
      'Watch readers from around the world read and interact with your site — in realtime.',
      'Catch up with your favorite sites and join the conversation anywhere, any time.',
      'Your notifications travel with you — see comments and likes as they happen.',
      'Manage your Jetpack-powered site on the go — you\'ve got WordPress in your pocket.'
  ]

  def initialize(driver, platform)
    @driver = driver
    @platform = platform
    @landing_locators = LandingPageLocators.new.locators platform
  end

  def is_on_landing_page
    explicitly_wait_for_presence @landing_locators[:login_button]
  end

end