class Message < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates :message, presence: true
end
