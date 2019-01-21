@api_call_main_page
Feature: Visitor can change language
    As a user
    In order to be able to read articles in my native language,
    I would like to switch between languages English and Swedish

    Background:
        Given the following category exists:
            | name     |
            | Sport    |
            | Weather  |
            | Science |
            | Culture  |
            
        And I visit the landing page

    Scenario: Visitor can see categories, register and login on index page
        Then I should see 'Register'
        And I should see 'Login'
        And I should see 'Sport'
        And I should see 'Weather'
        And I should see 'Science'
        And I should see 'Culture'
        
    Scenario: Visitor can see categories, register and login in swedish language
        Given I click on 'Svenska'
        Then I should see 'Registrera'
        And I should see 'Logga in'
        And I should see 'Sport'
        And I should see 'Väder'
        And I should see 'Politik'
        And I should see 'Kultur'