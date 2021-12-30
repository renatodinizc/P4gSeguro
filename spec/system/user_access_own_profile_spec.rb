require 'rails_helper'

describe 'User access own profile' do
  it 'and sees updated message if company was authorized successfully' do
    company = create(:company, status: 5)
    mary = create(:user, :owner, company: company)

    login_as mary, scope: :user
    visit root_path
    click_on 'My profile'

    expect(page)
      .not_to have_content 'You account is being evaluated by our admins'
  end

  it 'and sees denial message if company was not authorized successfully' do
    company = create(:company, status: 10)
    mary = create(:user, :owner, company: company)

    login_as mary, scope: :user
    visit root_path
    click_on 'My profile'

    expect(page).to have_content 'You account was not authorized by our admins'
  end
end