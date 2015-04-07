require 'selenium-webdriver'

class AppDriver

  def initialize
    @driver = Selenium::WebDriver.for :firefox
  end

  def method_missing(method, *args, &block)
    if @driver.respond_to?(method)
      @driver.send(method, *args, &block)
    else
      fail(NoMethodError, "Method #{method} not found on #{self} or #{@driver}")
    end
  end

  def find_element(attribute, selector)
    puts "Finding element by #{attribute}: #{selector}"
    @driver.find_element(attribute, selector)
  end

end