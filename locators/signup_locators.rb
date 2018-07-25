# Locators for the Signup page
class SignupLocators
  android_locators = {
    title_label: { id: 'org.wordpress.android:id/label' },
    email_field: { id: 'org.wordpress.android:id/input'},
    help_button: { id: 'org.wordpress.android:id/help' },
    next_button: { id: 'org.wordpress.android:id/primary_button' },
    magic_link_button: { id: 'org.wordpress.android:id/login_request_magic_link' },
    password_button: { id: 'org.wordpress.android:id/login_enter_password' },
    password_email: { id: 'org.wordpress.android:id/input' }
  }

  ios_locators = {
    title_label: { accessibility_id: 'To create your new WordPress.com account, please enter your email address.' },
    email_field: { accessibility_id: 'Email address'},
    help_button: { accessibility_id: 'Help' },
    next_button: { accessibility_id: 'Next Button' },
    magic_link_button: { accessibility_id: 'Send Link' },
    password_button: { accessibility_id: 'Use Password' },
    password_email: { accessibility_id: 'Password' }
  }

  LOCATORS = {
    android: android_locators,
    ios: ios_locators
  }.freeze

  def locators(platform)
    LOCATORS[platform]
  end
end