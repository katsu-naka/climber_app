FactoryBot.define do
  factory :message do
    message   {Faker::Types.rb_string }
    datetime  {"2020/11/11 11:11:11"}
    name      {"テスト太郎"}
    association :user
    association :task
  end
end
