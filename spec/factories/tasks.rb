FactoryBot.define do
  factory :task do
    date   {Faker::Date.in_date_period}
    title  {Faker::Types.rb_string}
    text   {Faker::Types.rb_string }
    done   { 1 }
    association :user
  end
end
