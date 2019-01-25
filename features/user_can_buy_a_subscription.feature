@javascript 
@stripe 
@api_call_main_page

Feature: User can buy a subscription

    As a user
    In order to get access to the best articles
    I would like to be able to buy a subscription

    Background:
        Given the following user exists
            | name | email          | password | password_confirmation | role   |
            | Bill | bill@email.com | password | password              | member |

        And the following article exists:
            | title      | description    | content               | user_id | category_id | published | premium |
            | News title | This is a news | I like to eat cheese! | Bill    | Weather     | true      | true    |

    Scenario: Member can buy a subscription from landing page
        Given I am logged in as 'bill@email.com'
        And I click on 'Become a subscriber'
        And I pay for a subscription
        Then I should see 'Thank you for subscribing to The Sunrise Press!'

    Scenario: Member can buy a subscription from article page
        Given I am logged in as 'bill@email.com'
        And I click on 'News title'
        And I click on 'Subscribe'
        And I pay for a subscription
        Then I should see 'Thank you for subscribing to The Sunrise Press!'
        
    Scenario: Visitors can buy a subscription from landing page
        Given I visit the landing page
        And I click on 'Become a subscriber'
        And I sign up for an account
        And I click on 'Become a subscriber'
        And I pay for a subscription
        Then I should see 'Thank you for subscribing to The Sunrise Press!'
    
    Scenario: Visitor can buy a subscription from article page
        Given I visit the landing page
        And I click on 'News title'
        And I click on 'Subscribe'
        And I sign up for an account
        And I click on 'Become a subscriber'
        And I pay for a subscription
        Then I should see 'Thank you for subscribing to The Sunrise Press!'
