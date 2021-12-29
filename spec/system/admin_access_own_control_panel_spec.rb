require 'rails_helper'

describe 'Admin access own control panel' do
  it 'and sees all pending accounts successfully' do
    peter = create(:admin, email: 'peter@p4gseguro.com', password: '123123')
    henri = create(:user, :owner, email: 'henri@nestle.com')
    elon = create(:user, :owner, email: 'elon@tesla.com')
    steve = create(:user, :owner, email: 'steve@apple.com')

    login_as peter, scope: :admin
    visit root_path
    click_on 'My control panel'

    expect(page).to have_content 'Pending accounts for approval'
    expect(page).to have_content 'Point of contact: henri@nestle.com'
    expect(page).to have_content "Company: #{henri.company.name}"
    expect(page).to have_content 'Point of contact: elon@tesla.com'
    expect(page).to have_content "Company: #{elon.company.name}"
    expect(page).to have_content 'Point of contact: steve@apple.com'
    expect(page).to have_content "Company: #{steve.company.name}"
  end
  it 'and accept new company successfully' do
    peter = create(:admin, email: 'peter@p4gseguro.com', password: '123123')
    henri = create(:user, :owner, email: 'henri@nestle.com')

    login_as peter, scope: :admin
    visit root_path
    click_on 'My control panel'
    click_on 'Accept company'

    expect(page).not_to have_content 'Point of contact: henri@nestle.com'
    expect(page).not_to have_content "Company: #{henri.company.name}"
  end
end
