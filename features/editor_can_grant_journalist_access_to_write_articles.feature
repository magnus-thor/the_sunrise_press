Feature: Editor can grant journalist access to write articles

    As an editor
    In order to have up to date local news 
    I would like to be able to allow journalists to write articles


    Background:
        Given the following user exists
            | name | email          | password |    role      |
            | Bill | bill@email.com | password |    member    |
            | Jon  | jon@email.com  | password |    editor    |

    Scenario: Editor can switch role between member and journalist
        Given I am logged in as 'jon@email.com'
        When I click on 'Users'
        And I click on 'Set as Journalist'
        Then I should see 'Updated Successfully!'
        And I click on 'Set as Member'
        And I should see 'Updated Successfully!'