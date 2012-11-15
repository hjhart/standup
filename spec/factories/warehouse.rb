FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "password"
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end

  factory :daily_task do
    sequence(:task) { |n| "well, here is your task ##{n}" }
    association :daily_report, factory: :daily_report
  end

  factory :daily_report do
    association :user, factory: :user
  end
end