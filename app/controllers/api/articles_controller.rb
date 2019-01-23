class Api::ArticlesController < ApplicationController
    def index
        articles = Article.all_published
        render json: articles, each_serializer: Articles::IndexSerializer
    end

    def show
        article = Article.find(params[:id])
        render json: article, serializer: Articles::ShowSerializer
    end
end