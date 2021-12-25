require 'rails_helper'

describe 'Visitor visits homepage' do
  it 'successfully' do
    visit root_path

    expect(page).to have_content 'Welcome to P4gSeguro'
    expect(page).to have_content 'Everything you need a bank to be'
  end
end
