RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.append_after(:each) do
    FactoryBot.rewind_sequences
  end
end
