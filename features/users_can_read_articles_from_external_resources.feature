@api_call_main_page

Feature: Users can read articles from external resources

    As a User,
    In order to read a wide variety of articles
    I would like to have access to third-party news.

    Background:
        Given I visit the landing page

    Scenario: User should see a top news item from news_api
        Then I should see 'Outside source'
        Then I should see "Ryder Cup 2018: Why we should all be excited about Tiger's return" 
        And I should see 'BBC Sport looks at the reasons why golf fans around the world are relishing the return of Tiger Woods to Ryder Cup action.'
        And I should see 'Read the full story'