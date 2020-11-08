class Message < ApplicationRecord
  belongs_to :user
  belongs_to :task

  with_options presence: true do
    validates :message
    validates :datetime
    validates :name
  end
end
