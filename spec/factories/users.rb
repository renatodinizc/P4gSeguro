FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@company.com" }
    password { '123123' }
    company

    trait :owner do
      owner { true }
    end
  end
end
