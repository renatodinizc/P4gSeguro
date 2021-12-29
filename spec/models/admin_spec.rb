require 'rails_helper'

describe Admin do
  context 'on account creation' do
    it 'cannot have outsider email successfully' do
      admin = Admin.new(email: 'admin@gmail.com', password: '123123')

      admin.valid?

      expect(admin.errors.full_messages_for(:email)).to include
      'Email is of an invalid domain'
    end
  end
end
