FactoryBot.define do
  factory :sns_credential do
    provider {Faker::String.random(length: 3..12)}
    uid      {Faker::String.random(length: 3..12)}
    association :user
  end
end
