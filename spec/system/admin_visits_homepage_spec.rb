require 'rails_helper'

describe 'Admin visits home page' do
  it 'and creates new admin account on platform successfully' do
    visit root_path
    click_on 'Create new Admin account'
    fill_in 'Email', with: 'peter@p4gseguro.com'
    fill_in 'Password', with: '123123', match: :prefer_exact
    fill_in 'Password confirmation', with: '123123', match: :prefer_exact
    click_on 'Sign up'

    expect(page).to have_content 'Welcome to P4gSeguro'
    expect(page).to have_content 'You have signed up successfully.'
    expect(page).to have_content 'peter@p4gseguro.com is logged in as Admin'
  end

  it 'and logs into platform successfully' do
    create(:admin, email: 'peter@p4gseguro.com', password: '123123')

    visit root_path
    click_on 'Login as Admin'
    fill_in 'Email', with: 'peter@p4gseguro.com'
    fill_in 'Password', with: '123123'
    click_on 'Log in'

    expect(page).to have_content 'Welcome to P4gSeguro'
    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content 'peter@p4gseguro.com is logged in as Admin'
  end

  it 'log in and logs out successfully' do
    peter = create(:admin, email: 'peter@p4gseguro.com', password: '123123')

    login_as peter, scope: :admin
    visit root_path
    click_on 'Log out'

    expect(page).to have_content 'Login as Admin'
    expect(page).to have_content 'Signed out successfully.'
    expect(page).not_to have_content 'Log out'
  end
end
