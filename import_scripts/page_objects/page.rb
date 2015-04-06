require 'selenium-webdriver'

class Page

  def initialize(driver)
    @driver = driver
  end

  def go
    @driver.navigate.to(get_url)
  end

end