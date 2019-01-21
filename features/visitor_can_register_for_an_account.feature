@api_call_main_page
Feature: Visitor can register for an account

    As a Visitor,
    In order to access unique features on the news app,
    I would like to be able to register for an account on the site.

    Background:
        Given the following user exists
        | email          | password | password_confirmation |
        | bill@email.com | password | password              |
        
        Given I visit the landing page
        And I click on 'Register'

    Scenario: When I fill in the sign up form correctly, I can sign up
        Given I fill in 'Email' field with 'mail@email.com'
        And I fill in 'Password' field with 'password'
        And I fill in 'Password confirmation' field with 'password'
        And I click on 'Sign up'
        Then I should see 'Welcome! You have signed up successfully.'

    Scenario: When password is too short, I get an error message
        Given I fill in 'Email' field with 'bill@email.com'
        And I fill in 'Password' field with 'hello'
        And I fill in 'Password confirmation' field with 'hello'
        And I click on 'Sign up'
        Then I should see 'Password is too short (minimum is 6 characters)'

    Scenario: When password confirmation doesn't match password, I get an error message
        Given I fill in 'Email' field with 'bill@email.com'
        And I fill in 'Password' field with 'password'
        And I fill in 'Password confirmation' field with 'pasword'
        And I click on 'Sign up'
        Then I should see "Password confirmation doesn't match Password"

    Scenario: When Email is taken I get an error message
        Given I fill in 'Email' field with 'bill@email.com'
        And I fill in 'Password' field with 'password'
        And I fill in 'Password confirmation' field with 'password'
        And I click on 'Sign up'
        Then I should see 'Email has already been taken'