require 'selenium-webdriver'
require_relative 'page_objects/home_page.rb'

driver = Selenium::WebDriver.for :firefox

# Everything starts at the homepage
home_page = HomePage.new(driver)
home_page.go

# Navigate to the Add Feature page
add_feature_page = home_page.goto_add_feature_page
# Add the feature
puts "Adding feature: #{feature.name}"
add_feature_outcome_page = add_feature_page.add_feature(feature.name, feature.description)
# Check nothing went wrong
if add_feature_outcome_page.fail?
  # Abandon execution if something did go wrong
  fail("Error occurred while adding feature: #{add_feature_outcome_page.get_error}")
end

# Go to the Add Scenario page
home_page = add_feature_outcome_page.goto_home_page
add_scenario_page = home_page.goto_add_scenario_page

# Add all the scenarios
feature.scenarios.each do |scenario|
  puts "Adding scenario: #{scenario.title}"
  add_scenario_outcome_page = add_scenario_page.add_scenario(feature.name, scenario)
  # Check nothing went wrong
  if add_scenario_outcome_page.fail?
    # Abandon execution if something did go wrong
    fail("Error occurred while adding scenario: #{add_scenario_outcome_page.get_error}")
  end
end

driver.quit
