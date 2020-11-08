FactoryBot.define do
  factory :message do
    message   {Faker::Types.rb_string }
    datetime  {"2020/11/11 11:11:11"}
    name      {Faker::String.random(length: 3..12)}
    association :user
    association :task
  end
end
