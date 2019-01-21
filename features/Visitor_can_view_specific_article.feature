@api_call_main_page
Feature: Visitor can read a specific article

    As a visitor
    In order to read an article
    I would like to be able to click on an article and have it displayed

    Background:
        Given the following user exists
            | name | email          | password | password_confirmation | role       |
            | Bill | bill@email.com | password | password              | journalist |

        And the following article exists:
            | title      | description        | content                      | user_id | category_id | published |
            | News title | This is a news     | I like to eat cheese!        | Bill    | Weather     | true      |

        And I visit the landing page
        And I click on 'News title'

    Scenario: Visitor can see specific article
        And I should see 'News title'
        And I should see 'This is a news'
        And I should see 'Bill'