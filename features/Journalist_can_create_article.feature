@api_call_main_page
Feature: Journalist can create article

    As a journalist,
    In order to write articles
    I would like to be able to have an article creation form

    Background:
        Given the following user exists
            | name | email          | password | password_confirmation | role       |
            | Bill | bill@email.com | password | password              | journalist |

        And the following category exists:
            | name    |
            | Sport   |
            | Weather |
            
        And I am logged in as 'bill@email.com'
        And I click on 'New article'

    Scenario: Journalist can create article
        Given I fill in 'Title' field with 'My article'
        And I fill in 'Description' field with 'This is a description'
        And I fill in 'Content' field with 'This is my article about the sunny weather'
        And I attach a file
        And I select 'Weather' from 'Category'
        And I click on 'Save Article'
        Then I should see 'My article'
        And I should see 'Bill'
        And I should see 'This is my article about the sunny weather'

    Scenario: Journalist fills out New article form unsuccessfully
        When I click on 'Save Article'
        Then I should see 'Every field needs to be filled in!'