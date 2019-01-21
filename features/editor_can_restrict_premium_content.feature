@api_call_main_page
Feature: Editor can restrict premium articles for non-subscribers

    As a site owner,
    In order to get more subscribers,
    I would like to restrict certain content and offer special premium content to paid subscribers only

    Background:
        Given the following user exists
            | name | email          | password | password_confirmation | role       |
            | Bill | bill@email.com | password | password              | editor     |
            | Jill | jill@email.com | password | password              | member     |
            | Sill | sill@email.com | password | password              | subscriber |

        And the following article exists:
            | title   | description        | content                      | user_id | category_id | premium | published |
            | News    | This is a news     | I like to eat cheese!        | Bill    | Weather     | false   | true      |
            | Article | This is an article | I do not like to eat cheese! | Bill    | Sport       | true    | true      |

    Scenario: Editor can restrict content by making it premium
        Given I am logged in as 'bill@email.com'
        And I click on 'Articles'
        And I click on 'Review' within 'News'
        And I click on 'Set as premium article'
        And I click on 'Logout'
        And I am logged in as 'jill@email.com'
        When I click on 'News'
        Then I should see 'Premium content. To access content, please subscribe.'
    
    Scenario: Subscriber can see premium content
        Given I am logged in as 'sill@email.com'
        And I click on 'Article'
        Then I should see 'I do not like to eat cheese!'
        And I should not see 'Premium content. To access content, please subscribe.'
