require 'spec_helper'

describe Payload::Github do
  context 'given a Github post hook payload' do
    subject { Payload::Github.new(github_webhook_params) }

    let(:github_parsed_payload) { JSON.parse(github_payload) }

    it 'should set the payload attribute' do
      expect(subject.payload).to eql(github_parsed_payload)
    end

    describe '#commits' do
      it 'should format a list of commits as a struct' do
        expect(subject.commits.length).to eql(3)

        expect(subject.commits[0].url).to(
          eql(github_parsed_payload['commits'][0]['url']))
        expect(subject.commits[0].message).to eql('Fix #20')
        expect(subject.commits[0].author).to eql("John Doe")
      end
    end

    describe '#events' do
      it 'should extract the events from the commits' do
        expect(subject.events.length).to eql(2)

        expect(subject.events[1].type).to eql('ticket_finished')
        expect(subject.events[1].parameters[:ticket_id]).to eql(21)
      end
    end
  end
end
