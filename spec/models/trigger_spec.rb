require 'spec_helper'

describe Trigger do
  it { should belong_to(:project) }

  it { should validate_presence_of(:project) }

  it { should validate_presence_of(:event_type) }
  it { should validate_presence_of(:action_name) }
end
