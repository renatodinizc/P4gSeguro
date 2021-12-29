FactoryBot.define do
  factory :feedback do
    body { 'Company suspected of fraud' }
    company { nil }
  end
end
