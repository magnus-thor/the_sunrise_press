@api_call_main_page
Feature: Editor can review and publish articles

    As an editor,
    In order to make sure that the articles have good standards
    I would like an article review page where I can approve and publish articles.

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

    Scenario: Editor can see nonpublished articles
        Then I should see 'News' within 'not_published'
        And I should see 'This is a news' within 'not_published'
        And I should see 'Article' within 'not_published'
        And I should see 'This is an article' within 'not_published'

    Scenario: Editor can approve articles
        Given I click on 'Review' within 'News'
        When I click on 'Publish article'
        Then I should see 'News' within 'published'
        And I should see 'This is a news' within 'published'
        And I should see 'Article' within 'not_published'
        And I should see 'This is an article' within 'not_published'