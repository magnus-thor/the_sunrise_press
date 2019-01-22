class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @external_articles = NewsFeedService.get_feed('all', 'cnn', 'http://us.cnn.com', 15) 
  end
end
