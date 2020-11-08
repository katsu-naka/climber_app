class SnsCredential < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :provider
    validates :uid
  end
end
