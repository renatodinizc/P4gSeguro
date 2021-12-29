require 'rails_helper'

describe 'Admin access own control panel' do
  context 'main page' do
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

    it 'and accept a new company account successfully' do
      peter = create(:admin, email: 'peter@p4gseguro.com', password: '123123')
      henri = create(:user, :owner, email: 'henri@nestle.com')

      login_as peter, scope: :admin
      visit root_path
      click_on 'My control panel'
      click_on 'Accept company'

      expect(page).not_to have_content 'Point of contact: henri@nestle.com'
      expect(page).not_to have_content "Company: #{henri.company.name}"
    end

    it 'and denies a new company account successfully' do
      peter = create(:admin, email: 'peter@p4gseguro.com', password: '123123')
      henri = create(:user, :owner, email: 'henri@company1.com')

      login_as peter, scope: :admin
      visit root_path
      click_on 'My control panel'
      click_on 'Deny company'
      fill_in 'Body', with: 'Suspicious information'
      click_on 'Create Feedback'

      expect(page).not_to have_content 'Point of contact: henri@company1.com'
      expect(page).not_to have_content "Company: #{henri.company.name}"
    end

    it 'and denies a new company account without feedback unsuccessfully' do
      peter = create(:admin, email: 'peter@p4gseguro.com', password: '123123')
      create(:user, :owner, email: 'henri@company1.com')

      login_as peter, scope: :admin
      visit root_path
      click_on 'My control panel'
      click_on 'Deny company'
      click_on 'Create Feedback'

      expect(page).to have_content "Body can't be blank"
      expect(page)
        .to have_content 'Body is too short (minimum is 10 characters)'
    end
  end

  context 'and goes to list of all company status' do
    it 'successfully' do
      peter = create(:admin, email: 'peter@p4gseguro.com', password: '123123')
      company1 = create(:company, status: 0)
      company2 = create(:company, status: 5)
      company3 = create(:company, status: 10)
      create(:user, :owner, email: 'owner1@company1.com', company: company1)
      create(:user, :owner, email: 'owner2@company2.com', company: company2)
      create(:user, :owner, email: 'owner3@company3.com', company: company3)

      login_as peter, scope: :admin
      visit root_path
      click_on 'My control panel'
      click_on 'List of companies'

      expect(page).not_to have_content company1.name.to_s
      expect(page).not_to have_content 'Status: pending_approval'
      expect(page).to have_content company2.name.to_s
      expect(page).to have_content 'Status: approved'
      expect(page).to have_content company3.name.to_s
      expect(page).to have_content 'Status: denied'
    end
  end
end
