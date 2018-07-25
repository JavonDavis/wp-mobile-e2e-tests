# Locators for the login Page
class LoginPageLocators

  android_locators = {
    title_label: { id: 'org.wordpress.android:id/label' },
    email_field: { id: 'org.wordpress.android:id/input' },
    help_button: { id: 'org.wordpress.android:id/help' },
    next_button: { id: 'org.wordpress.android:id/primary_button' },
    magic_link_button: { id: 'org.wordpress.android:id/login_request_magic_link' },
    error_label: { id: 'org.wordpress.android:id/textinput_error' },
    enter_password_button: { id: 'org.wordpress.android:id/login_enter_password' },
    password_field: { id: 'org.wordpress.android:id/input' },
    log_in_button: { id: 'org.wordpress.android:id/primary_button' }
  }

  ios_locators = {
    email_field: { accessibility_id: 'Email address' },
    help_button: { accessibility_id: 'Help' },
    next_button: { accessibility_id: 'Next Button' },
    error_label: { accessibility_id: 'pswdErrorLabel' },
    magic_link_button: { accessibility_id: 'Send Link' },
    enter_password_button: { accessibility_id: 'Use Password' },
    password_field: { accessibility_id: 'Password' },
    log_in_button: { accessibility_id: 'Log In Button' }
  }

  LOCATORS = {
    android: android_locators,
    ios: ios_locators
  }.freeze

  def locators(platform)
    LOCATORS[platform]
  end
end