class Inquiry < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :text
  end
end
