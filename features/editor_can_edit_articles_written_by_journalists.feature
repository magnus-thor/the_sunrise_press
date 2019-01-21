@api_call_main_page
Feature: Editor can edit articles written by journalists

    As an editor
    In order to modify an article written by a journalist
    I would like to be able to edit it

    Background:
        Given the following user exists
            | name | email          | password | password_confirmation | role   |
            | Bill | bill@email.com | password | password              | editor |

        And the following article exists:
            | title   | description        | content                      | user_id | category_id |
            | News    | This is a news     | I like to eat cheese!        | Bill    | Weather     |
            | Article | This is an article | I do not like to eat cheese! | Bill    | Sport       |
            
        And I am logged in as 'bill@email.com'
        And I click on 'Articles'

    Scenario: Editor can edit articles written by journalists
        Given I click on 'Review' within 'News'
        When I click on 'Edit article'
        And I fill in 'Title' field with 'Article'
        And I fill in 'Description' field with 'This is an article'
        And I fill in 'Content' field with 'I do not like to eat cheese!'
        And I attach a file
        And I select 'Sport' from 'Category'
        And I click on 'Save Article'
        Then I should see 'Updated successfully!'