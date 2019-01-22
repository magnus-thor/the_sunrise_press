class Api::ArticlesController < ApplicationController
    def index
        articles = Article.all_published
        render json: {articles: articles}
    end
end
  