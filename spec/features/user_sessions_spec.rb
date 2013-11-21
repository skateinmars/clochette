require 'spec_helper'

feature "User sessions" do
  context "Given an existing user" do
    let!(:user) { FactoryGirl.create(:user) }

    scenario "Logging in" do
      visit login_path

      expect(current_path).to eql(login_path)

      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'password'

      click_on I18n.t('user_sessions.form.login')

      expect(current_path).to eql(root_path)
      expect(page).to have_text(user.email)
    end

    scenario "Failing to log in" do
      visit login_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'wrong_password'

      click_on I18n.t('user_sessions.form.login')

      expect(current_path).not_to eql(root_path)
      expect(page.body).to have_text(I18n.t('user_sessions.create.invalid'))
    end

    scenario "Logging out" do
      login_user(user)

      visit root_path

      click_on 'logout'

      expect(current_path).to eql(login_path)
      expect(page).not_to have_text(user.email)
    end
  end
end
