@api_call_main_page
Feature: User can login and logout

    As a registered user
    In order to access more unique functions on the website
    I would like to be able to log in and log out

    Background:
        Given the following user exists
        | email          | password |  
        | bill@email.com | password | 
        
        Given I visit the landing page
        And I click on 'Log in'

    Scenario: When I fill in the login form correctly, I can login
        Given I fill in 'Email' field with 'bill@email.com'
        And I fill in 'Password' field with 'password'
        And I click on 'Login'
        Then I should see 'Signed in successfully.'

    Scenario: When I fill in the login form incorrectly, I get an error
        Given I click on 'Login'
        Then I should see 'Invalid Email or password.'

    Scenario: When I am logged in, I should be able to logout
        Given I am logged in as 'bill@email.com'
        And I click on 'Log out'
        Then I should see 'Signed out successfully.'