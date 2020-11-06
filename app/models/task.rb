class Task < ApplicationRecord
  belongs_to :user
  has_many :messages

  with_options presence: true do
    validates :title, length: { maximum: 40 , message: "40字以内で入力してください"}
    validates :date
    validates :done
  end
end
