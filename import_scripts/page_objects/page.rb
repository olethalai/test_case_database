require 'selenium-webdriver'

class Page

  def initialize(driver)
    puts "Initialising #{self}..."
    @driver = driver
  end

  def go
    @driver.navigate.to(get_url)
  end

end