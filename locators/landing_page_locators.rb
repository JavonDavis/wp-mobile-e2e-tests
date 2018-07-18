# Locators for the Landing Page
class LandingPageLocators
  android_locators = {
    login_button: { id: 'org.wordpress.android:id/login_button' },
    sign_up: {
      sign_up_button: { id: 'org.wordpress.android:id/create_site_button' },
      sign_up_with_email: { id: 'org.wordpress.android:id/signup_email' }
    },
    promo_label: { id: 'org.wordpress.android:id/promo_text' }
  }

  ios_locators = {
    login_button: { accessibility_id: 'Log In Button' },
    sign_up: {
      sign_up_button: { accessibility_id: 'Sign up for WordPress.com Button' },
      sign_up_with_email: { accessibility_id: 'Sign up with Email Button' }
    },
    promo_label: { predicate: 'type = "XCUIElementTypeStaticText"' }
  }

  LOCATORS = {
    android: android_locators,
    ios: ios_locators
  }.freeze

  def locators(platform)
    LOCATORS[platform]
  end

end