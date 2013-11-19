require 'spec_helper'

describe Trigger do
  it { should belong_to(:project) }

  it { should validate_presence_of(:project) }

  it { should validate_presence_of(:event_type) }
  it { should validate_presence_of(:action_name) }

  describe "action_name validation" do
    it { should allow_value('no_op').for(:action_name) }
    it { should_not allow_value('unknown_action').for(:action_name) }
  end
end
