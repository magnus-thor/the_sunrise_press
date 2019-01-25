# The Sunrise Press
---
This is a news website built on the Ruby on Rails framework. It allows visitors to view both inhouse and sourced news articles. Visitors can sign up to comment on articles and to receive the Sunrise newsletter. In addition, they can subscribe to view articles tagged as premium content. 

The editor can assign the journalist role, allowing a 'journalist' to create and submit articles. The editor can then also approve these (inhouse) articles and both publish and set them as premium content. 

The live site can be viewed [here](https://the-sunrise-press.herokuapp.com/).

# Basic features included:
* Visitor can sign up for an account
* Visitor can buy a subscription
* Visitor can view all listed articles
* Visitor can read articles from external source
* Visitor can view articles in categories
* Visitor can view specific article
* User can login and logout
* User can comment on articles when logged in
* Editor can assign 'journalist' role
* Editor can edit articles written by journalists
* Editor can review and publish articles
* Journalist can create article
* Journalist can update article

# API features included:
* External clients can access available articles via app API
* External client can access specific articles

# Tech stack
* Ruby on Rails
* Rspec for unit testing
* Cucumber for acceptance testing
* APIs used:
    * [Stripe](https://stripe.com/docs/api)
    * [News-api](https://newsapi.org/)

# To use this code
* Clone the repo from https://github.com/CraftAcademy/the_sunrise_press and `cd` into the project folder
* Run `bundle` to install all Ruby gems
* Run `yarn install` to install all Javascript dependencies
* Run `rails db:setup` to set up the database
* Run `rake` to ensure all unit and acceptance tests pass
* Run `rails s` to start the server
* Visit `https://localhost:3000` in your browser to view the app

# Team
* [Camron](https://github.com/CamronLDNF)
* [Jon](https://github.com/Bovverskin)
* [Johanna](https://github.com/johannaanden)
* [Shahin](https://github.com/shahin1290)