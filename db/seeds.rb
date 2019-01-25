require 'faker'

Article.destroy_all
Category.destroy_all

general = Category.create(name: 'General')
Category.create(name: 'Business')
Category.create(name: 'Entertainment')
Category.create(name: 'Health')
Category.create(name: 'Technology')
science = Category.create(name: 'Science')
sports = Category.create(name: 'Sports')


member = User.create(email: 'member@mail.com', name: 'Stefan Löven', password: 'password', role: 0)
subscriber = User.create(email: 'subscriber@mail.com', name: 'Magnus Uggla', password: 'password', role: 1)
journalist = User.create(email: 'journalist@mail.com', name: 'Christiane Amanpour', password: 'password', role: 2)
editor = User.create(email: 'editor@mail.com', name: 'Gunde Svan', password: 'password', role: 3)

2.times do 
    article = Article.create(
        published: true, 
        premium: true,
        title: 'US shutdown: Senate rejects bills to re-open government', 
        description: 'The US Senate has rejected two bills to end the government shutdown, leaving no end in sight to the record-breaking closure of federal agencies.',
        content: 'The Republican legislation failed by 50-47 and the Democratic bill followed suit by 52-44. Each bill needed 60 votes to move forward. Meanwhile, 800,000 federal workers missed another payday on Friday. At 34 days with no end in sight, this is the longest shutdown in US history.',
        journalist: journalist.name,
        user_id: journalist.id, 
        category_id: general.id)
    article.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'breakingnews.png')), filename: "placeholder-image.png", content_type: 'image/png')

end

2.times do
    article = Article.create(
        published: true, 
        title: 'Rafael Nadal crushes Stefanos Tsitsipas to reach Australian Open final', 
        description: 'Second seed Rafael Nadal ended Greek youngster Stefanos Tsitsipas captivating run to reach his fifth Australian Open final.', 
        content: 'Nadal, 32, was in devastating form as he beat the 20-year-old 14th seed 6-2 6-4 6-0 in one hour and 46 minutes. The Spaniard cracked 28 winners, breaking Tsitsipas serve six times and only facing one break point himself. He will play either top seed Novak Djokovic or Frances Lucas Pouille - who meet on Friday - in Sundays final.', 
        journalist: journalist.name,
        user_id: journalist.id, 
        category_id: sports.id)
    article.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'breakingnews.png')), filename: "placeholder-image.png", content_type: 'image/png')

end

2.times do
    article = Article.create(
        title: Faker::GreekPhilosophers.quote, 
        description: Faker::Lorem.paragraph_by_chars(180, false), 
        content: Faker::Lorem.paragraph_by_chars(300, false), 
        journalist: journalist.name,
        user_id: journalist.id, 
        category_id: science.id)
    article.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'breakingnews.png')), filename: "placeholder-image.png", content_type: 'image/png')
end

