require 'spec_helper'

describe Action do
  describe '.register_action' do
    it "should add an action to the available_actions" do
      action_name = 'do_something'
      action_class = String

      Action.register_action(action_name, action_class)

      expect(Action.available_actions).to include({'do_something' => String})
    end
  end

  describe '.fetch' do
    context "fetching a registered action" do
      let(:action_name) { 'do_something' }
      let(:action_class) { String }

      before do
        Action.register_action(action_name, action_class)
      end

      it "should return the associated action class" do
        expect(Action.fetch(action_name)).to eql(action_class)
      end
    end

    context "fetching an unregistered action" do
      let(:action_name) { 'nothing' }

      it "should raise an ArgumentError" do
        expect { Action.fetch(action_name) }.to raise_error(ArgumentError)
      end
    end
  end
end
