FactoryBot.define do
  factory :project do
    project_name {Faker::String.random(length: 3..12)}
  end
end
