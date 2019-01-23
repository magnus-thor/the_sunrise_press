class Article < ApplicationRecord
    has_one_attached :image
    validates_presence_of :title, :description, :content
    belongs_to :category
    belongs_to :user
    has_many :comments

    scope :all_published, -> { where(published: true) }
    
    def published?
        published
    end

    def not_published?
        !published
    end
end