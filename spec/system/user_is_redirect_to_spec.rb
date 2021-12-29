require 'rails_helper'

describe 'User is redirect to company registration form after login,' do
  it 'successfully' do
    User.create(email: 'mary@nestle.com', password: '123123')

    visit root_path
    click_on 'Login as User'
    fill_in 'Email', with: 'mary@nestle.com'
    fill_in 'Password', with: '123123'
    click_on 'Log in'
    visit current_path

    expect(page).to have_content 'Company registration form'
  end

  it 'adds new company to platform and proceeds to personal profile' do
    User.create(email: 'mary@nestle.com', password: '123123')

    visit root_path
    click_on 'Login as User'
    fill_in 'Email', with: 'mary@nestle.com'
    fill_in 'Password', with: '123123'
    click_on 'Log in'
    visit current_path
    fill_in 'Name', with: 'Nestle Inc.'
    fill_in 'Cnpj', with: '99999999999999'
    fill_in 'Billing address', with: 'Fake Avenue, 123'
    fill_in 'Billing email', with: 'fake@nestle.com'
    click_on 'Create Company'

    expect(page).to have_content 'mary@nestle.com profile'
    expect(page).to have_content 'Company: Nestle Inc.'
    expect(page).to have_content 'CNPJ: 99999999999999'
    expect(page).to have_content 'Billing address: Fake Avenue, 123'
    expect(page).to have_content 'Billing email: fake@nestle.com'
  end

  it 'and cannot let blank fields successfully' do
    User.create(email: 'mary@nestle.com', password: '123123')

    visit root_path
    click_on 'Login as User'
    fill_in 'Email', with: 'mary@nestle.com'
    fill_in 'Password', with: '123123'
    click_on 'Log in'
    visit current_path
    click_on 'Create Company'

    expect(page).not_to have_content 'mary@nestle.com profile'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Cnpj can't be blank"
    expect(page).to have_content "Billing address can't be blank"
    expect(page).to have_content "Billing email can't be blank"
  end
end
