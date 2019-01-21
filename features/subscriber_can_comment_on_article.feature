@api_call_main_page
Feature: Subscriber can comment on article

    As a Subscriber
    In order to voice my opinion or ask questions
    I would like to be able to leave a comment on an article

    Background:
        Given the following user exists
            | name    | email             | password | role           |
            | Bill    | bill@mail.com     | password | journalist     |
            | Johanna | johanna@email.com | password | subscriber     |

        And the following article exists:
            | title | description    | content               | user_id | category_id | published |
            | News  | This is a news | I like to eat cheese! | Bill    | Weather     | true      |

        And I visit the landing page

    Scenario: A logged in user can submit a comment [Happy Path]
        Given I am logged in as 'johanna@email.com'
        And I click on 'News'
        And I fill in 'Body' field with 'This is my comment'
        And I click on 'Create Comment'
        Then I should see 'Johanna'
        And I should see 'This is my comment'

    Scenario: A visitor cannot submit a comment [Sad Path]
        Given I click on 'News'
        Then I should not see 'Body'
        And I should not see 'Create Comment'
