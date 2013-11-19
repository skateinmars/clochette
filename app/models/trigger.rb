class Trigger < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :project

  validates_presence_of :event_type

  validates_presence_of :action_name
  validate :action_name_is_registered

  scope :with_event_type, ->(event_type) { where(event_type: event_type) }

  private

  def action_name_is_registered
    return if action_name.blank?

    unless Action.available_actions.key?(action_name)
      errors.add(:action_name, :must_be_registered)
    end
  end
end
