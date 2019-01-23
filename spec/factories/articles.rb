FactoryBot.define do
  factory :article do
    title { 'An article' }
    description { 'It is not long' }
    content { 'As I told you, that is it' }
    journalist { 'Jon' }
    published { false }
    category
    user
    after(:build) do |article|
      article.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'basic_image.png')),
                           filename: 'attachment.png',
                           content_type: 'image/png')
    end
  end
end