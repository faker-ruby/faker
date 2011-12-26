Feature: Address
    In order to generate fake data
    As a CLI
    I want to be able to get fake address data

    Scenario: No options
        When I run `faker address`
        Then the output should contain "Run `faker help address` for a list of valid types"

    Scenario: Help
        When I run `faker help address`
        Then the output should contain "Usage:"

