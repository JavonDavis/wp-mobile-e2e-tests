class BasePage
  DEFAULT_WAIT_TIME = 6

  WEBDRIVER_ERRORS = [
      Selenium::WebDriver::Error::TimeOutError,
      Selenium::WebDriver::Error::NoSuchElementError
  ].freeze

  def explicitly_wait_for_presence(locator = nil, wait_time = DEFAULT_WAIT_TIME)
    puts "Explicitly waiting for element: #{locator}"
    begin
      wait = Selenium::WebDriver::Wait.new(timeout: wait_time)
      wait.until do
        @driver.find_element(locator)
      end
      return true
    rescue *WEBDRIVER_ERRORS => e
      puts "Element not found after waiting #{wait_time} seconds"
      puts e.message
      return false
    end
  end

  def wait_then_click(locator, wait_time = DEFAULT_WAIT_TIME)
    is_present = explicitly_wait_for_presence(locator, wait_time)
    unless is_present
      print 'Element not present after wait'
      return
    end
    begin
      element = @driver.find_element(locator)
      element.click
      return true
    rescue *WEBDRIVER_ERRORS => e
      puts 'Wait Then Click: Error'
      puts e.message
      return false
    end
  end
end
