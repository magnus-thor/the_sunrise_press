class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum role: {member: 0, subscriber: 1, journalist: 2, editor: 3}
  has_many :articles
end
