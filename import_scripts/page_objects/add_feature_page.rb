require 'selenium-webdriver'
require_relative 'page'
require_relative 'add_feature_outcome_page'

class AddFeaturePage < Page

  def get_url
    "http://localhost/test_case_database/add_feature.php"
  end

  def add_feature(feature)
    # TODO: Implement method
    AddFeatureOutcomePage.new(@driver)
  end

end