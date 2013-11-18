require 'spec_helper'

describe Event do
  describe '.new' do
    let(:type) { :finish }
    let(:parameters) { {ticket_id: 42, comment: "Helpful comment"} }

    subject do
      Event.new(type, parameters)
    end

    it 'should set the type attribute' do
      expect(subject.type).to eql(type)
    end

    it 'should set the parameters attribute' do
      expect(subject.parameters).to eql(parameters)
    end
  end
end
