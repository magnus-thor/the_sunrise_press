class Api::ArticlesController < ApplicationController
    before_action :authenticate_user!, only: :show
    def index
        articles = Article.all_published
        render json: articles, each_serializer: Articles::IndexSerializer
    end

    def show
        # binding.pry
        article = Article.find(params[:id])
        render json: article, serializer: Articles::ShowSerializer
    end
end