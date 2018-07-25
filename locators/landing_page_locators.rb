# Locators for the initial landing page
class LandingPageLocators
  android_locators = {
    login_button: { id: 'org.wordpress.android:id/login_button' },
    signup_button: { id: 'org.wordpress.android:id/create_site_button' },
    signup_email_button: { id: 'org.wordpress.android:id/signup_email' },
    promo_label: { id: 'org.wordpress.android:id/promo_text' }
  }

  ios_locators = {
    login_button: { accessibility_id: 'Log In Button' },
    signup_button: { accessibility_id: 'Sign up for WordPress.com Button' },
    signup_email_button: { accessibility_id: 'Sign up with Email Button' },
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