require 'rails_helper'

RSpec.describe 'Article index', type: :request do
  describe 'GET /api/articles' do
    let!(:articles) { 5.times { create(:article) } }

    before do 
      get '/api/articles'
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns 5 articles' do
      expect(JSON.parse(response.body)['articles'].count).to eq 5
    end

  end
end