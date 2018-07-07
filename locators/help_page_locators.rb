class HelpPageLocators

  android_locators = {
    title_label: {id: 'org.wordpress.android:id/create_account_label'},
  }

  ios_locators = {
    title_label: {accessibility_id: 'WordPress Help Center'}
  }

  locators = {
      android: android_locators,
      ios: ios_locators
  }
end