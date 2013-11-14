require 'spec_helper'
require 'clochette/action'

describe Clochette::Action do
  describe '.new' do
    let(:type) { :finish }
    let(:ticket_id) { 42 }
    let(:comment) { "Helpful comment" }

    subject do
      Clochette::Action.new(type, ticket_id: ticket_id, comment: comment)
    end

    it 'should set the type attribute' do
      expect(subject.type).to eql(type)
    end

    it 'should set the ticket_id attribute' do
      expect(subject.ticket_id).to eql(ticket_id)
    end

    it 'should set the comment attribute' do
      expect(subject.comment).to eql(comment)
    end
  end
end
