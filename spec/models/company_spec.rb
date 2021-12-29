require 'rails_helper'

describe Company do
  context 'validation on' do
    it 'attributtes successfully' do
      company = Company.new

      company.valid?

      expect(company.errors.full_messages_for(:name))
        .to include "Name can't be blank"
      expect(company.errors.full_messages_for(:cnpj))
        .to include "Cnpj can't be blank"
      expect(company.errors.full_messages_for(:billing_address))
        .to include "Billing address can't be blank"
      expect(company.errors.full_messages_for(:billing_email))
        .to include "Billing email can't be blank"
    end
  end
end
