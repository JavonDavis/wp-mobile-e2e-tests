# Author::    Javon Davis  (mailto:javonldavis14@gmail.com)
# License::   Distributes under the same terms as Ruby

# The class should be defined as the Parent class for all page
# objects in the project. It provides useful methods for
# interacting with elements and validating presence

class BasePage
  # time in seconds
  DEFAULT_WAIT_TIME = 6

  WEBDRIVER_ERRORS = [
      Selenium::WebDriver::Error::TimeOutError,
      Selenium::WebDriver::Error::NoSuchElementError
  ].freeze

  # Waits for a specified number of seconds for the presence of an element
  # Params:
  #
  #
  # * +remove_string+ - Document the first attribute
  # * +append_string+ - Document the second attribute
  # * +options+ - Document the third attribute
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

  def swipe(element, direction)
    direction.downcase!
    case direction
      when 'left'
        start_x = element.location['x'].to_i + element.size['width'].to_i
        start_y = 0
        end_x = 0
        end_y = 0
      when 'right'
        start_x = 0
        start_y = 0
        end_x = 0
        end_y = 0
      when 'up'
        start_x = 0
        start_y = 0
        end_x = 0
        end_y = 0
      when 'down'
        start_x = 0
        start_y = 0
        end_x = 0
        end_y = 0
      else
        puts "Can not swipe in direction #{direction}"
        return false
    end

    Appium::TouchAction.new.swipe(start_x: start_x, start_y: start_y, end_x: end_x, end_y:end_y, duration: 300).perform
    true
  end
end
