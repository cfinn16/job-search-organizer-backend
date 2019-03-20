class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  has_many :jobs
  has_many :tasks
end
