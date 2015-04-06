require 'selenium-webdriver'
require_relative 'page'
require_relative 'add_feature_page'
require_relative 'add_scenario_page'

class HomePage < Page

  def get_url
    "http://localhost/test_case_database/index.html"
  end

  def goto_add_feature_page
    element = @driver.find_element(:link_text, 'Add Feature')
    element.click
    AddFeaturePage.new(@driver)
  end

  def goto_add_scenario_page
    element = @driver.find_element(:link_text, 'Add Scenario')
    element.click
    AddScenarioPage.new(@driver)
  end

end
