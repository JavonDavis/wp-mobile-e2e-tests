class LoginPageLocators
  android_locators = {
      email_field: {id: 'org.wordpress.android:id/input'},
      help_button: {id: 'org.wordpress.android:id/help'},
      next_button: {id: 'org.wordpress.android:id/primary_button'}
  }

  ios_locators = {
      email_field: {id: 'org.wordpress.android:id/input'},
      help_button: {id: 'org.wordpress.android:id/help'},
      next_button: {id: 'org.wordpress.android:id/primary_button'}
  }

  locators = {
      android: android_locators,
      ios: ios_locators
  }
end