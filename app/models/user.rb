class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks
  has_many :projects , through: :project_users
  has_many :project_users


  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze

  with_options presence: true do
    validates :name, format: {with: NAME_REGEX, message: 'は全角で入力してください'}
  end
end
