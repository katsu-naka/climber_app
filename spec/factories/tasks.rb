FactoryBot.define do
  factory :task do
    date   {Date.today}
    title  {Faker::Types.rb_string}
    text   {Faker::Types.rb_string }
    done   { 1 }
    association :user
  end
end
