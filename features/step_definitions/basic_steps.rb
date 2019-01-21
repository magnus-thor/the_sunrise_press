Given('the following article exists:') do |table|
    table.hashes.each do |article|
        user = User.find_by(name: article[:user_id])
        category = Category.find_or_create_by(name: article[:category_id])
        article.except!(article[:user_id]).except!(article[:category_id]).merge!(user_id: user.id).merge!(category_id: category.id)
        FactoryBot.create(:article, article)
    end
end

Given('the following category exists:') do |table|
    table.hashes.each do |category|
        FactoryBot.create(:category, category)
    end
end

Given('I visit the landing page') do
    visit root_path
end

Given('I click on {string}') do |link|
    click_on link
end

Given('the following user exists') do |table|
    table.hashes.each do |user|
        FactoryBot.create(:user, user)
    end 
end

Given('I click {string} within {string}') do |element, card|
    selected_card = card.split.first
    article = Article.find_by(title: selected_card)
    dom_section = "#article_#{article.id}"
    within(dom_section) do
        click_on element
    end
end

Given('I fill in {string} field with {string}') do |element, value|
    fill_in element,with: value
end

Given('I select {string} from {string}') do |option, selector|
    select option, from: selector
end

Given('I am logged in as {string}') do |email|
    @user = User.find_by email: email
    login_as @user, scope: :user
    visit root_path
end

Then('I fill in the payment form') do
    card_no = '42'
    stripe_iframe = find("iframe[name='__privateStripeFrame4']", visible: false)
    within_frame stripe_iframe do
        card_field = find_field('cardnumber')
        card_field.native.clear
        8.times { sleep 0.1; card_field.send_keys(right: card_no); sleep 0.1; }
    
        find_field('exp-date').send_keys('1221')
        find_field('cvc').send_keys('123')
    end
end

Given("I submit the payment form") do
    click_on 'Submit Payment'
    sleep 3
end

Then('show me the page') do
    save_and_open_page
end

When("I click on {string} within {string}") do |button, title|
    article = Article.find_by(title: title)
    dom_section = "#article_#{article.id}" 
    within(dom_section) do 
        click_on button
    end
end

Given("I attach a file") do
    attach_file('article_image', "#{::Rails.root}/spec/fixtures/basic_image.png")
end

When('I sign up for an account') do
    steps %{
        Given I should see 'Register'
        And I fill in 'Email' field with 'new@mail.com'
        And I fill in 'Password' field with 'password'
        And I fill in 'Password confirmation' field with 'password'
        And I click on 'Sign up'
    }
end

When('I pay for a subscription') do
    steps %{
        And I fill in the payment form
        And I submit the payment form
    }
end

