require 'rails_helper'

RSpec.describe 'Article index', type: :request do
    describe 'GET articles#index ' do
        context 'all articles' do
            let!(:published_articles) { 5.times { create(:article, published: true) } }
            let!(:unpublished_articles) { 5.times { create(:article, published: false) } }

            before do
                get '/api/articles'
            end
            
            it 'returns 200' do
                expect(response).to have_http_status(200)
            end

            it 'returns 5 articles' do
                expect(response_json['articles'].count).to eq 5
            end
        end

        context 'articles associations' do
            let(:user) { create(:user, email: 'member@mail.com') }
            let(:category) { create(:category, name: 'Sports') }
            let!(:published_article) { create(:article, title: 'My first article', content: 'It is about sports', user: user, category: category, published: true )}
            let!(:unpublished_article) { create(:article, title: 'My second article', user: user, category: category, published: false  )}

            before do
                get '/api/articles'
            end

            it 'includes info about user' do
                expected_email = response_json['articles'][0]['user']['email']
                expect(expected_email).to eq 'member@mail.com' 
            end

            it 'includes info about title' do
                expected_title = response_json['articles'][0]['title']
                expect(expected_title).to eq 'My first article' 
            end

            it 'includes info about content' do
                expected_content = response_json['articles'][0]['content']
                expect(expected_content).to eq 'It is about sports' 
            end

            it 'includes info about category' do
                expected_category = response_json['articles'][0]['category']['name']
                expect(expected_category).to eq 'Sports' 
            end

            it 'includes info about image' do
                expected_url = response_json['articles'][0]['image']
                expect(expected_url).to match(/attachment.png/)
            end
        end
    end

    describe 'GET articles#show ' do

        context 'specific article' do
            let(:user) { create(:user, email: 'member@mail.com') }
            let(:category) { create(:category, name: 'Sports') }
            let!(:published_article) { create(:article, title: 'My first article', content: 'It is about sports', user: user, category: category, published: true )}
            let!(:unpublished_article) { create(:article, title: 'My second article', user: user, category: category, published: false  )}

            before do
                get "/api/articles/#{published_article.id}"
            end
            
            it 'is a valid request' do
                expect(response.status).to eq 200
            end
            
            it 'includes article' do
                article = response_json["article"]["title"]
                expect(article).to eq 'My first article'
            end
        
            it 'includes category' do
                category = response_json['article']['category']['name']
                expect(category).to eq 'Sports'
            end
        
            it 'includes user' do
                author = response_json['article']['user']['name']
                expect(author).to eq user.name
            end
        end
    end
end