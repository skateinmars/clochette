require 'spec_helper'

describe Payload::Github::Commit do
  context 'given a Github post hook payload' do
    let(:commit_data) { JSON.parse(github_payload)['commits'][0] }
    subject { Payload::Github::Commit.new(commit_data) }

    it 'should set the id attribute' do
      expect(subject.id).to eql(commit_data['id'])
    end

    it 'should set the url attribute' do
      expect(subject.url).to eql(commit_data['url'])
    end

    it 'should set the author attribute' do
      expect(subject.author).to eql(commit_data['author']['name'])
    end

    it 'should set the message attribute' do
      expect(subject.message).to eql(commit_data['message'])
    end

    describe '#comment' do
      it 'should format the commit infos' do
        expect(subject.comment).to match(subject.author)
        expect(subject.comment).to match(subject.message)
        expect(subject.comment).to match(subject.url)
      end
    end

    describe '#actions' do
      it 'should extract the actions from the commit' do
        expect(subject.actions.length).to eql(1)

        expect(subject.actions[0].type).to eql(:finish)
        expect(subject.actions[0].ticket_id).to eql(20)
      end
    end
  end
end
