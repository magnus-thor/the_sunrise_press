class Article < ApplicationRecord
    has_one_attached :image
    validates_presence_of :title, :description, :content
    belongs_to :category
    belongs_to :user


    def published?
        self.published
    end

    def not_published?
        !self.published
    end
end
