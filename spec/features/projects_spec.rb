require 'spec_helper'

feature "Projects" do

  context "Given an existing project" do
    let!(:project) { FactoryGirl.create(:project) }

    scenario "Accessing the index" do
      visit projects_path

      expect(current_path).to eql(projects_path)

      expect(page.body).to have_text(project.name)
    end

    scenario "Deleting the project" do
      visit projects_path

      click_on I18n.t('helpers.links.destroy')

      expect(current_path).to eql(projects_path)
      expect(page.body).to have_text(I18n.t('projects.destroy.success'))

      expect(Project.where(id: project.id).exists?).to be_false
    end
  end

  scenario "Creating a project" do
    project_name = FactoryGirl.attributes_for(:project)[:name]

    visit projects_path

    click_on 'new_project'

    fill_in 'Name', with: project_name

    click_button I18n.t('helpers.links.save')

    expect(current_path).to eql(projects_path)
    expect(page.body).to have_text(I18n.t('projects.create.success'))

    expect(Project.where(name: project_name).exists?).to be_true
  end

  scenario "Failing to create a project" do
    visit projects_path

    click_on 'new_project'

    click_button I18n.t('helpers.links.save')

    expect(page.body).to have_text(I18n.t('projects.create.invalid'))
  end

end
