Feature: Internet
    In order to generate fake data
    As a CLI
    I want to be able to get fake internet data

    Scenario: No options
        When I run `faker internet`
        Then the output should contain "Run `faker help internet` for a list of valid types"

    Scenario: Help
        When I run `faker help internet`
        Then the output should contain "Usage:"

    Scenario: Email
        When I run `faker internet -f email`
        Then the output should match /.+@.+\.\w+/

    Scenario: Free Email
        When I run `faker internet -f free_email`
        Then the output should match /.+@(gmail|hotmail|yahoo)\.com/

    Scenario: Username
        When I run `faker internet -f user_name`
        Then the output should match /[a-z]+((_|\.)[a-z]+)?/

    Scenario: Domain Name
        When I run `faker internet -f domain_name`
        Then the output should match /\w+\.\w+/

    Scenario: Domain Word
        When I run `faker internet -f domain_word`
        Then the output should match /^\w+$/

    Scenario: Domain Suffix
        When I run `faker internet -f domain_suffix`
        Then the output should match /^\w+(\.\w+)?/
        
    Scenario: IP4 Address
        When I run `faker internet -f ip_v4_address`
        Then the output should match /^\d+\.\d+\.\d+\.\d+$/

    Scenario: IP6 Address
        When I run `faker internet -f ip_v6_address`
        Then the output should match /^(((([1]?\d)?\d|2[0-4]\d|25[0-5])\.){3}(([1]?\d)?\d|2[0-4]\d|25[0-5]))|([\da-fA-F]{1,4}(\:[\da-fA-F]{1,4}){7})|(([\da-fA-F]{1,4}:){0,5}::([\da-fA-F]{1,4}:){0,5}[\da-fA-F]{1,4})$/
    
