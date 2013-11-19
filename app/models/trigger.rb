class Trigger < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :project

  validates_presence_of :event_type, :action_name

  scope :with_event_type, ->(event_type) { where(event_type: event_type) }
end
