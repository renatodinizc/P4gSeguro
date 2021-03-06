require 'rails_helper'

describe 'User visits home page' do
  it 'and creates new user account on platform successfully' do
    visit root_path
    click_on 'Create new User account'
    fill_in 'Email', with: 'mary@nestle.com'
    fill_in 'Password', with: '123123', match: :prefer_exact
    fill_in 'Password confirmation', with: '123123', match: :prefer_exact
    click_on 'Sign up'

    expect(page).not_to have_content 'Welcome to P4gSeguro'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
    expect(page).to have_content 'mary@nestle.com is logged in as User'
  end

  it 'and logs into platform successfully' do
    create(:user, email: 'mary@nestle.com', password: '123123')

    visit root_path
    click_on 'Login as User'
    fill_in 'Email', with: 'mary@nestle.com'
    fill_in 'Password', with: '123123'
    click_on 'Log in'

    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content 'mary@nestle.com is logged in as User'
  end

  it 'and access own profile successfully' do
    mary = create(:user, email: 'mary@nestle.com', password: '123123')

    login_as mary, scope: :user
    visit root_path
    click_on 'My profile'

    expect(page).to have_content 'mary@nestle.com profile'
  end

  it 'log in and logs out successfully' do
    mary = create(:user, email: 'mary@nestle.com', password: '123123')

    login_as mary, scope: :user
    visit root_path
    click_on 'Log out'

    expect(page).to have_content 'Login as User'
    expect(page).to have_content 'Signed out successfully.'
    expect(page).not_to have_content 'Log out'
  end
end
