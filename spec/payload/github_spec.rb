require 'spec_helper'
require 'clochette/payload/github'

describe Clochette::Payload::Github do
  context 'given a Github post hook payload' do
    subject { Clochette::Payload::Github.new(github_payload) }

    it 'should set the payload attribute' do
      expect(subject.payload).to eql(github_payload)
    end

    describe '#commits' do
      it 'should format a list of commits as a struct' do
        expect(subject.commits.length).to eql(3)

        expect(subject.commits[0].url).to eql('example.org')
        expect(subject.commits[0].message).to eql('Fix #20')
        expect(subject.commits[0].email).to eql('toto@example.org')
      end
    end

    describe '#actions' do
      it 'should extract the actions from the commits' do
        expect(subject.actions.length).to eql(2)

        expect(subject.actions[1]).to eql({action_type: :finish, ticket_id: 21})
      end
    end
  end
end
