class Feature

  attr_reader :name, :description, :scenarios

  def initialize(path_to_feature_file)
    read_feature(path_to_feature_file)
    read_scenarios(path_to_feature_file)
  end

  def read_feature(path_to_feature_file)
    # TODO: Tidy this method up to use a similar method to scenario reading i.e. while this_line (stripped)...
    # Read in feature file
    feature_file = File.new("#{path_to_feature_file}", "r")
    # Find the feature title
    this_line = feature_file.gets
    while !this_line.match /Feature: /
      this_line = feature_file.gets
    end
    @name = this_line.strip

    # Find the description, if there is one
    @description = ''
    this_line = feature_file.gets
    while !this_line.match /Scenario: /
      @description += this_line
      this_line = feature_file.gets
    end
    @description = @description.strip

    feature_file.close
  end

  def read_scenarios(path_to_feature_file)
    # Read in feature file
    feature_file = File.new("#{path_to_feature_file}", "r")
    @scenarios = []

    # Find scenarios
    first_scenario = true
    scenario_title = ''
    scenario_description = ''
    steps = []
    while this_line = feature_file.gets
      this_line = this_line.strip
      if this_line.match /^Scenario: /
        unless first_scenario
          # Add previously read scenario to the scenarios array
          @scenarios.push Scenario.new(scenario_title, scenario_description, *steps)
        end
        first_scenario = false
        scenario_title = this_line
      elsif this_line.match /^(Given|When|Then|And|But|\*) /
        steps.push this_line
      elsif this_line == ''
        # Do nothing
      else
        # Either a scenario description or the start of the feature file, before any scenarios
        # Any lines before the first scenario can be ignored
        unless first_scenario
          scenario_description += this_line
        end

      end

    end
    # Add the last scenario to the scenarios array
    @scenarios.push Scenario.new(scenario_title, scenario_description, *steps)

    feature_file.close
  end

end