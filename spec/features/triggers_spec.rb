require 'spec_helper'

feature "Triggers" do
  context "Given a logged in user" do
    before do
      login_user
    end

    context "Given an existing project" do
      let!(:project) { FactoryGirl.create(:project) }

      context "Given an existing trigger" do
        let!(:trigger) { FactoryGirl.create(:trigger, project: project) }

        scenario "Accessing the triggers index for the project" do
          visit project_triggers_path(project)

          expect(current_path).to eql(project_triggers_path(project))

          expect(page.body).to have_text(project.name)
          expect(page.body).to have_text(trigger.event_type)
        end

        scenario "Deleting the trigger" do
          visit project_triggers_path(project)

          click_on I18n.t('helpers.links.destroy')

          expect(current_path).to eql(project_triggers_path(project))
          expect(page.body).to have_text(I18n.t('triggers.destroy.success'))

          expect(Trigger.where(id: trigger.id).exists?).to be_false
        end
      end

      scenario "Creating a trigger" do
        trigger_attributes = {
                              event_type: 'ticket_finished',
                              action_name: 'no_op'
                            }

        visit project_triggers_path(project)

        select(trigger_attributes[:event_type], from: 'Event type')
        select(trigger_attributes[:action_name], from: 'Action name')

        click_button I18n.t('helpers.links.save')

        expect(current_path).to eql(project_triggers_path(project))
        expect(page.body).to have_text(I18n.t('triggers.create.success'))

        expect(Trigger.where(trigger_attributes).exists?).to be_true
      end

      scenario "Failing to create a trigger" do
        visit project_triggers_path(project)

        click_button I18n.t('helpers.links.save')

        expect(current_path).to eql(project_triggers_path(project))

        expect(page.body).to have_text(I18n.t('triggers.create.invalid'))
      end
    end
  end

  context "Given the user is not logged in" do
    scenario "Accessing the index" do
      visit project_triggers_path('project_uid')

      expect(current_path).to eql(login_path)
    end
  end
end
