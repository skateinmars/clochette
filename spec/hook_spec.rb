require 'spec_helper'
require 'clochette/hook'

describe Clochette::Hook do
  describe '.hooks' do
    it "builds a list of Hook classes" do
      expect(described_class.hooks).to include(Clochette::Hook::Trello)
    end
  end

  describe '.trigger' do
    it "dispatches payload actions to the hook classes" do
      actions_mock = double('actions')

      trello_hook_mock = double('trello')
      expect(trello_hook_mock).to receive(:perform)
      expect(Clochette::Hook::Trello).to receive(:new).
                                          with(actions_mock).
                                          and_return(trello_hook_mock)

      described_class.trigger(actions_mock)
    end
  end
end
