class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :tasks
  has_many :projects , through: :project_users
  has_many :project_users
  has_many :sns_credentials


  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze

  with_options presence: true do
    validates :name, format: {with: NAME_REGEX, message: 'は全角で入力してください'}
  end

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
