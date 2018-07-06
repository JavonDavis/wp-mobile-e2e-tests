class LandingPageLocators
  android_locators = {
    login_button: {id: 'org.wordpress.android:id/login_button'},
    sign_up_button: {id: 'org.wordpress.android:id/create_site_button'}
  }

  ios_locators = {
    login_button: {accessibility_id: 'Log In Button'},
    sign_up_button: {accessibility_id: 'Sign up for WordPress.com Button'}
  }

  locators = {
      android: android_locators,
      ios: ios_locators
  }
end