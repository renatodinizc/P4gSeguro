require 'rails_helper'

describe User do
  context 'on account creation' do
    it 'cannot have public domain email' do
      user = User.new(email: 'user@google.com', password: '123123')

      user.valid?

      expect(user.errors.full_messages_for(:email)).to include
      'Email is of an invalid domain'
    end
  end
end
