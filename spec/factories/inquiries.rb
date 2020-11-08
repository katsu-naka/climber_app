FactoryBot.define do
  factory :inquiry do
    name  {Faker::String.random(length: 3..12)}
    text   {Faker::Types.rb_string }
  end
end
