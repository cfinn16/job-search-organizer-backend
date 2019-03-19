class User < ApplicationRecord
  has_secure_password

  has_many :user_jobs
  has_many :jobs, through: :user_jobs
  has_many :tasks, through: :user_jobs
end
