class Feature

  attr_reader :name, :description, :scenarios

  def initialize(path_to_feature_file)
    # TODO: Implement feature reading
    @name = 'Default Feature Name'
    @description = ''
    @scenarios = []
    read_scenarios(path_to_feature_file)
  end

  def read_scenarios(path_to_feature_file)
    # TODO: Implement scenario reading
    @scenarios.push Scenario.new("Test scenario", "", "When I do this", "Then it does that")
  end

end