@api_call_main_page
Feature: Visitor can see articles in categories

    As a visitor
    In order to read about the topics which interest me the most
    I would like to see news sorted in categories

    Background:
        Given the following user exists
            | name | email          | password | password_confirmation | role       |
            | Bill | bill@email.com | password | password              | journalist |

        And the following article exists:
            | title   | description        | content                      | user_id | category_id | published |
            | News    | This is a news     | I like to eat cheese!        | Bill    | Sport       | true      |
            | Article | This is an article | I do not like to eat cheese! | Bill    | Weather     | true      |
            
        And I visit the landing page

    Scenario: Visitor can see based on categories
        When I click on 'Weather'
        Then I should see 'Article'
        And I should see 'This is an article'
        And I should not see 'News'
        And I should not see 'This is a news'