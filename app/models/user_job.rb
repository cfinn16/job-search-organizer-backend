class UserJob < ApplicationRecord
  belongs_to :user
  belongs_to :job
  has_many :tasks
end
