require_relative 'page'
require_relative 'home_page'

class AddFeatureOutcomePage < Page

  def fail?
    # TODO: Implement method
  end

  def goto_home_page
    # TODO: Implement method
    HomePage.new(@driver)
  end

end