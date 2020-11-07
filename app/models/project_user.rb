class ProjectUser < ApplicationRecord
  belongs_to :user
  belongs_to :project

  with_options presence: true do
    validates :project_id
  end
end
