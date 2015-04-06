Feature: Test Import Feature

  As a tester, I want to import my feature files into a database so that I can store them and make test runs out of them with ease.

  Scenario: Adding a scenario

    Given I have a feature file
    When I import my feature file
    Then my scenarios will appear in the database
