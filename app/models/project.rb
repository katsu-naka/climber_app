class Project < ApplicationRecord
  has_many :project_user
  has_many :users, through: :project_user
end
