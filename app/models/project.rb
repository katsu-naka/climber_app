class Project < ApplicationRecord
  has_many :project_user,dependent: :destroy
  has_many :users, through: :project_user

  with_options presence: true do
    validates :project_name
  end
end
