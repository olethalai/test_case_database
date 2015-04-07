require_relative 'page'
require_relative '../page_objects/add_scenario_outcome_page'

class AddScenarioPage < Page

  def add_scenario(feature_name, scenario)
    feature_name_dropdown_element = @driver.find_element(:id, 'input_feature_name')
    feature_name_dropdown_select = Selenium::WebDriver::Support::Select.new(feature_name_dropdown_element)
    scenario_title_text_box = @driver.find_element(:id, 'input_scenario_title')
    scenario_description_text_box = @driver.find_element(:id, 'input_scenario_description')
    steps_text_box = @driver.find_element(:id, 'input_steps')
    submit_button = @driver.find_element(:id, 'submit_scenario')

    feature_name_dropdown_select.select_by(:text, feature_name)
    scenario_title_text_box.send_keys(scenario.title)
    scenario_description_text_box.send_keys(scenario.description)
    steps = scenario.steps.join("\n")
    steps_text_box.send_keys(steps)
    submit_button.click

    AddScenarioOutcomePage.new(@driver)
  end

end