class Users::UserInfoForArticleIndexSerializer < ActiveModel::Serializer
    attributes :name, :email
end