require 'spec_helper'

feature "Homepage" do

  scenario "Accessing the homepage" do
    visit '/'

    expect(current_path).to eql('/')
  end

end
