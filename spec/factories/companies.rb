FactoryBot.define do
  factory :company do
    name { FFaker::Company.unique.name }
    cnpj { FFaker::IdentificationBR.unique.cnpj }
    billing_address { 'MyString' }
    billing_email { 'MyString' }
  end
end
