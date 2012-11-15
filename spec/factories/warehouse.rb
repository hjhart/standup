FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "johndoe#{n}@example.com" }
    password "password"
  end

  factory :daily_task do
    sequence(:task) { |n| "well, here is your task ##{n}" }
    association :daily_report, factory: :daily_report
  end

  factory :daily_report do
    association :user, factory: :user
  end
end