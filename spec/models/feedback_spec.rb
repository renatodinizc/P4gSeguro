require 'rails_helper'

describe Feedback do
  context 'validation on' do
    it 'attributtes successfully' do
      feedback = Feedback.new

      feedback.valid?

      expect(feedback.errors.full_messages_for(:body))
        .to include "Body can't be blank"
      expect(feedback.errors.full_messages_for(:body))
        .to include 'Body is too short (minimum is 10 characters)'
    end
  end
end
