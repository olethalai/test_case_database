require_relative 'page'
require_relative 'home_page'

class AddFeatureOutcomePage < Page

  def goto_home_page
    element = @driver.find_element(:link_text, 'Home')
    element.click
    HomePage.new(@driver)
  end

  def fail?
    sql_outcome_paragraph = @driver.find_element(:id, 'sql_outcome')
    sql_outcome_paragraph.text.include?("ERROR")
  end

  def get_error
    sql_outcome_paragraph = @driver.find_element(:id, 'sql_outcome')
    sql_outcome_paragraph.text
  end

end