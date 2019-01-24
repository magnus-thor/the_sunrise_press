@api_call_main_page
Feature: Visitor can change language
    As a user
    In order to be able to read articles in my native language,
    I would like to switch between languages English and Swedish

    Background:
        Given the following category exists:
            | name     |
            | Sport    |
            | Business |
            | Science  |
            | Health   |

        And I visit the landing page

    Scenario: Visitor can see categories, register and login on index page
        Then I should see 'Register'
        And I should see 'Log in'
        And I should see 'Sport'
        And I should see 'Business'
        And I should see 'Health'

    Scenario: Visitor can see categories, register and login in swedish language
        Given I click on 'SV'
        Then I should see 'Registrera'
        And I should see 'Logga in'
        And I should see 'Sport'
        And I should see 'Finans'
        And I should see 'Hälsa'