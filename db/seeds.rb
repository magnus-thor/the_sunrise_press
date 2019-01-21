require 'faker'

Article.destroy_all
Category.destroy_all

Category.create(name: 'General')
Category.create(name: 'Business')
Category.create(name: 'Entertainment')
Category.create(name: 'Health')
Category.create(name: 'Technology')
science = Category.create(name: 'Science')
sports = Category.create(name: 'Sports')


member = User.create(email: 'member@mail.com', name: 'Member', password: 'password', role: 0)
subscriber = User.create(email: 'subscriber@mail.com', name: 'Subscriber', password: 'password', role: 1)
journalist = User.create(email: 'journalist@mail.com', name: 'Journalist', password: 'password', role: 2)
editor = User.create(email: 'editor@mail.com', name: 'Editor', password: 'password', role: 3)

2.times do 
    Article.create(
        published: true, 
        title: Faker::GreekPhilosophers.quote, 
        description: Faker::DumbAndDumber.quote,
        content: Faker::HowIMetYourMother.quote, 
        user_id: journalist.id, 
        category_id: science.id)
end

2.times do
    Article.create(
        published: true, 
        title: Faker::GreekPhilosophers.quote, 
        description: Faker::DumbAndDumber.quote, 
        content: Faker::HowIMetYourMother.quote, 
        user_id: journalist.id, 
        category_id: sports.id)
end

2.times do
    Article.create(
        title: Faker::GreekPhilosophers.quote, 
        description: Faker::DumbAndDumber.quote, 
        content: Faker::HowIMetYourMother.quote, 
        user_id: journalist.id, 
        category_id: science.id)
end
