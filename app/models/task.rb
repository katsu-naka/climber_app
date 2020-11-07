class Task < ApplicationRecord
  belongs_to :user
  has_many :messages,dependent: :destroy

  with_options presence: true do
    validates :title
    validates :date
    validates :done
  end
end
