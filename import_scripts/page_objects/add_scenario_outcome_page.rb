require_relative 'page'
require_relative 'home_page'
require_relative 'add_scenario_page'


class AddScenarioOutcomePage < Page

  def goto_home_page
    element = @driver.find_element(:link_text, 'Home')
    element.click
  end

  def goto_add_scenario_page
    element = @driver.find_element(:link_text, 'Add another scenario')
    element.click
  end

  def fail?
    sql_outcome_paragraph = @driver.find_element(:id, 'sql_outcome')
    sql_outcome_paragraph.text.include?("ERROR")
  end

  def get_error
    # TODO: Implement method
  end

end