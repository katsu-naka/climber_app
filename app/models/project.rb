class Project < ApplicationRecord
  has_many :project_user,dependent: :destroy
  has_many :users, through: :project_user
end
