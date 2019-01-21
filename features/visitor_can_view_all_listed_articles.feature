@api_call_main_page
Feature: Visitor can view all listed articles

    As a visitor
    In order to choose an article to read
    I would like to be able to see the articles listed on a page

    Background:
        Given the following user exists
            | name | email          | password | password_confirmation | role       |
            | Bill | bill@email.com | password | password              | journalist |
            
        And the following article exists:
            | title | description    | content               | user_id | category_id | published |
            | News  | This is a news | I like to eat cheese! | Bill    | Sport       | true      |
      

    Scenario: Visitor can see articles on index page
        Given I visit the landing page
        And I should see 'News'
        Then I should see 'This is a news'


