require 'rails_helper'

 RSpec.describe "Article index", type: :request do
  describe "GET /api_articles" do
    it "returns 200" do
      get '/api/articles'
      expect(response).to have_http_status(200)
    end
  end
end