require 'selenium-webdriver'
require_relative 'page_objects/home_page.rb'
require_relative 'data_objects/feature.rb'
require_relative 'data_objects/scenario.rb'

path_to_feature_file = ENV['FEATURE'] || '../features/test.feature'

feature = Feature.new(path_to_feature_file)

def log(message)
  puts message
end

def shutdown_with_failure(error_message)
  # Clean up browser instance
  @driver.quit
  # Raise error
  fail(error_message)
end

begin

  @driver = Selenium::WebDriver.for :firefox

  # Everything starts at the homepage
  home_page = HomePage.new(@driver)
  home_page.go

  # Navigate to the Add Feature page
  add_feature_page = home_page.goto_add_feature_page
  # Add the feature
  log "Adding feature: #{feature.name}"
  add_feature_outcome_page = add_feature_page.add_feature(feature)
  # Check nothing went wrong
  if add_feature_outcome_page.fail?
    # Abandon execution if something did go wrong
    error = "Error occurred while adding feature: #{add_feature_outcome_page.get_error}"
    shutdown_with_failure(error)
  end

  # Go to the Add Scenario page
  home_page = add_feature_outcome_page.goto_home_page
  add_scenario_page = home_page.goto_add_scenario_page

  # Add all the scenarios
  feature.scenarios.each do |scenario|
    log "Adding scenario: #{scenario.title}"
    add_scenario_outcome_page = add_scenario_page.add_scenario(feature.name, scenario)
    # Check nothing went wrong
    if add_scenario_outcome_page.fail?
      # Abandon execution if something did go wrong
      error = "Error occurred while adding scenario: #{add_scenario_outcome_page.get_error}"
      shutdown_with_failure(error)
    end
    # Go back to the Add Scenario page, ready for the next scenario
    add_scenario_page = add_scenario_outcome_page.goto_add_scenario_page
  end

  # Done - now tidy up
  @driver.quit

rescue => e
  shutdown_with_failure(e.message)
end