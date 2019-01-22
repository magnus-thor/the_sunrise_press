require 'rails_helper'

RSpec.describe 'Article index', type: :request do
    describe 'GET /api/articles' do
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
end