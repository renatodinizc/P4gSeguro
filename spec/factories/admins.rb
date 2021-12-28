FactoryBot.define do
  factory :admin do
    sequence(:email) { |n| "admin#{n}@p4gseguro.com" }
    password { '123123' }
  end
end
