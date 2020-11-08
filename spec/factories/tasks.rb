FactoryBot.define do
  factory :task do
    date   {Faker::Date.in_date_period}
    title  {Faker::String.random(length: 3..12)}
    text   {Faker::Types.rb_string }
    done   { 1 }
    association :user
  end
end
