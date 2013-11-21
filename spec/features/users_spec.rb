require 'spec_helper'

feature "Users" do
  context "Given a logged in user" do
    before do
      login_user
    end

    context "Given an existing user" do
      let!(:user) { FactoryGirl.create(:user) }

      scenario "Accessing the index" do
        visit users_path

        expect(current_path).to eql(users_path)

        expect(page.body).to have_text(user.email)
      end

      scenario "Deleting the user" do
        visit users_path

        within "#user_#{user.id}" do
          click_on I18n.t('helpers.links.destroy')
        end

        expect(current_path).to eql(users_path)
        expect(page.body).to have_text(I18n.t('users.destroy.success'))

        expect(User.where(id: user.id).exists?).to be_false
      end

      scenario "Updating the user" do
        new_email = 'newmail@example.org'

        visit users_path

        within "#user_#{user.id}" do
          click_on I18n.t('helpers.links.edit')
        end

        fill_in 'Email', with: new_email

        click_on I18n.t('helpers.links.save')

        expect(current_path).to eql(users_path)
        expect(page.body).to have_text(I18n.t('users.update.success'))

        user.reload
        expect(user.email).to eql(new_email)
      end

      scenario "Failing to update the user" do
        visit users_path

        within "#user_#{user.id}" do
          click_on I18n.t('helpers.links.edit')
        end

        fill_in 'Email', with: ''

        click_on I18n.t('helpers.links.save')

        expect(page.body).to have_text(I18n.t('users.update.invalid'))
      end
    end

    scenario "Creating a user" do
      user_attributes = FactoryGirl.attributes_for(:user)

      visit users_path

      click_on 'new_user'

      fill_in 'Email', with: user_attributes[:email]
      fill_in 'Password', with: user_attributes[:password]

      click_button I18n.t('helpers.links.save')

      expect(current_path).to eql(users_path)
      expect(page.body).to have_text(I18n.t('users.create.success'))

      expect(User.where(email: user_attributes[:email]).exists?).to be_true
    end

    scenario "Failing to create a user" do
      visit users_path

      click_on 'new_user'

      click_button I18n.t('helpers.links.save')

      expect(page.body).to have_text(I18n.t('users.create.invalid'))
    end
  end

  context "Given the user is not logged in" do
    scenario "Accessing the index" do
      visit users_path

      expect(current_path).to eql(login_path)
    end
  end

end
