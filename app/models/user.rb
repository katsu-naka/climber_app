class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :tasks,dependent: :destroy
  has_many :projects , through: :project_users,dependent: :destroy
  has_many :project_users,dependent: :destroy
  has_many :sns_credentials,dependent: :destroy
  has_many :messages,dependent: :destroy


  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze

  with_options presence: true do
    validates :name, format: {with: NAME_REGEX, message: 'は全角で入力してください'}
  end
  validates :email, uniqueness: { case_sensitive: false }

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
        name: auth.info.name,
        email: auth.info.email 
    )

    if user.persisted?
      sns.user = user
      sns.save
    end
    user
    { user: user, sns: sns }
  end
end
