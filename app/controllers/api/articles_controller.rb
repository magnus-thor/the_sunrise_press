class Api::ArticlesController < ApplicationController
    def index
        articles = Article.all_published
        render json: articles, each_serializer: Articles::IndexSerializer
    end
end