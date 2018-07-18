# Locators for the Sign up page
class SignUpPageLocators

  android_locators = {
    email_field: { id: 'org.wordpress.android:id/input' },
    help_button: { id: 'org.wordpress.android:id/help' },
    next_button: { id: 'org.wordpress.android:id/primary_button' },
    error_label: { id: 'org.wordpress.android:id/textinput_error' },
    sign_up_label: { id: 'org.wordpress.android:id/label' }
  }

  ios_locators = {
    email_field: { accessibility_id: 'Email address' },
    help_button: { accessibility_id: 'Help' },
    next_button: { accessibility_id: 'Next Button' }, # disabled when data incorrect
    sign_up_label: { predicate: 'type = "XCUIElementTypeStaticText"' }, # index 1
    error_label: { predicate: 'type = "XCUIElementTypeStaticText"' } # index 2
  }

  LOCATORS = {
    android: android_locators,
    ios: ios_locators
  }.freeze

  def locators(platform)
    LOCATORS[platform]
  end
end