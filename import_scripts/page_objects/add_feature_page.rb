require 'selenium-webdriver'
require_relative 'page'
require_relative 'add_feature_outcome_page'

class AddFeaturePage < Page

  def get_url
    "http://localhost/test_case_database/add_feature.php"
  end

  def add_feature(feature)
    name_text_box = @driver.find_element(:id, 'input_feature_name')
    description_text_box = @driver.find_element(:id, 'input_feature_description')
    submit_button = @driver.find_element(:id, 'submit_feature')

    name_text_box.send_keys(feature.name)
    description_text_box.send_keys(feature.description)
    submit_button.click

    AddFeatureOutcomePage.new(@driver)
  end

end