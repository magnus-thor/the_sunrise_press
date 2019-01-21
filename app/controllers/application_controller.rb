class ApplicationController < ActionController::Base
    before_action :get_categories, :set_locale

    private
    
    def get_categories
        @categories = Category.all
    end

    def set_locale
        I18n.locale = I18n.available_locales.include?(params[:locale]&.to_sym) ? params[:locale] : I18n.default_locale
    end
end


