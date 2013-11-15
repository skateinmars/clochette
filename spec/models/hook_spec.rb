require 'spec_helper'

describe Hook do
  describe '.hooks' do
    it "builds a list of Hook classes" do
      expect(described_class.hooks).to include(Hook::Trello)
    end
  end

  describe '.trigger' do
    it "dispatches payload actions to the hook classes" do
      actions_mock = double('actions')

      trello_hook_mock = double('trello')
      expect(trello_hook_mock).to receive(:perform)
      expect(Hook::Trello).to receive(:new).
                                          with(actions_mock).
                                          and_return(trello_hook_mock)

      described_class.trigger(actions_mock)
    end
  end
end
