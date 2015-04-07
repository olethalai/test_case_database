class Scenario

  attr_reader :title, :description, :steps

  def initialize(title, description, *steps)
    @title = title
    @description = description
    @steps = steps
  end

end