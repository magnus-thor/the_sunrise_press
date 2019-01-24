require 'coveralls'
Coveralls.wear_merged!('rails')
require 'cucumber/rails'
require 'webmock/cucumber'

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation

WebMock.allow_net_connect!
Chromedriver.set_version '2.42'

chrome_options = %w[no-sandbox disable-popup-blocking disable-infobars]

chrome_options << 'auto-open-devtools-for-tabs'

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new(
    args: chrome_options
  )
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options
  )
end

Before '@api_call_main_page' do 
  WebMock.disable_net_connect!(allow_localhost: true)
  stub_request(:get, "https://newsapi.org/v2/everything?domains=http://us.cnn.com&language=en&pageSize=15&q=all&sources=cnn").
    with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Host'=>'newsapi.org',
        'User-Agent'=>'Ruby',
        'X-Api-Key'=>'aa0deabbbff3418f9ed23311ef0c9ee1'
      }).
  to_return(status: 200, body: Rails.root.join('features', 'support', 'fixtures', 'api_call_main_page.txt').read, headers: {})
end

Before '@api_call_business' do 
  WebMock.disable_net_connect!(allow_localhost: true)
  stub_request(:get, "https://newsapi.org/v2/everything?domains=http://us.cnn.com&language=en&pageSize=15&q=Business&sources=cnn").
    with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Host'=>'newsapi.org',
        'User-Agent'=>'Ruby',
        'X-Api-Key'=>'aa0deabbbff3418f9ed23311ef0c9ee1'
      }).
  to_return(status: 200, body: Rails.root.join('features', 'support', 'fixtures', 'api_call_category_business.txt').read, headers: {})
end


Before '@stripe' do
  chrome_options << 'headless'
  StripeMock.start
end

After '@stripe' do 
  StripeMock.stop
end

Capybara.server = :puma
Capybara.javascript_driver = :chrome