require 'spec_helper'

feature "Homepage" do

  context "Given a logged in user" do
    before do
      login_user
    end

    scenario "Accessing the homepage" do
      visit root_path

      expect(current_path).to eql(root_path)
    end
  end

  context "Given the user is not logged in" do
    scenario "Accessing the homepage" do
      visit root_path

      expect(current_path).to eql(login_path)
    end
  end
end
