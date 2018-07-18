# @author   Javon Davis  (mailto:javonldavis14@gmail.com)

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
  #
  # @param [Map] locator A {<locator strategy>: <selector>} as a mapping
  # @param [Integer] wait_time Time in seconds to wait, defaults to (see #DEFAULT_WAIT_TIME)
  # @return [Boolean] true if the element was present, false otherwise
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

  # Waits for  specified number of seconds and then clicks the element if it's present
  # @param [Map] locator A {<locator strategy>: <selector>} as a mapping
  # @param [Integer] wait_time Time in seconds to wait, defaults to (see #DEFAULT_WAIT_TIME)
  # @return [Boolean] true if the element was present and we were able to click it, false otherwise
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

  # Swipes across the center of the element in the given direction
  # @param [WebDriverElement] element The element to be swiped across
  # @param [Symbol] direction, `:left`, `:right`, `:up`, or `:down`
  # @param [Integer] displacement How far off the edges to start and stop the swipe, defaults to 100px
  def swipe(element, direction, displacement = 100)
    puts "Swiping element #{direction}"
    case direction
      when :left
        start_x = element.location['x'].to_i + element.size['width'].to_i + displacement
        start_y = element.location['y'].to_i + element.size['height'].to_i/2
        end_x = element.location['x'].to_i - displacement
        end_y = element.location['y'].to_i + element.size['height'].to_i/2
      when :right
        start_x = element.location['x'].to_i - displacement
        start_y = element.location['y'].to_i + element.size['height'].to_i/2
        end_x = element.location['x'].to_i + element.size['width'].to_i + displacement
        end_y = element.location['y'].to_i + element.size['height'].to_i/2
      when :up
        start_x = element.location['x'].to_i + element.size['width'].to_i/2
        start_y = element.location['y'].to_i + element.size['height'].to_i + displacement
        end_x = element.location['x'].to_i + element.size['width'].to_i/2
        end_y = element.location['y'].to_i - displacement
      when :down
        start_x = element.location['x'].to_i + element.size['width'].to_i/2
        start_y = element.location['y'].to_i - displacement
        end_x = element.location['x'].to_i + element.size['width'].to_i/2
        end_y = element.location['y'].to_i + element.size['height'].to_i + displacement
      else
        puts "Can not swipe in direction #{direction}"
        return false
    end

    puts "Start x: #{start_x}\nStart y: #{start_y}\nEnd x: #{end_x}\nEnd y #{end_y}"

    # Appium::TouchAction.new.swipe(start_x: start_x, start_y: start_y, end_x: end_x, end_y:end_y, duration: 1000).perform

    driver.execute_script 'mobile: swipe', direction: direction.to_s
    true
  end
end
