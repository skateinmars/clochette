require 'spec_helper'
require 'clochette/application'
require 'clochette/payload/github'
require 'clochette/hook'
require 'json'

describe Clochette::Application do
  describe 'POST /github/:hook' do
    let(:payload) { {'payload' => 'test'} }
    let(:actions) { [{finish: 1}] }

    before do
      github_payload_mock = double('payload')
      expect(github_payload_mock).to receive(:actions).and_return(actions)

      expect(Clochette::Payload::Github).to receive(:new).
                                              with(payload).
                                              and_return(github_payload_mock)

      expect(Clochette::Hook).to receive(:trigger).with(actions)

      post '/github', payload: JSON.dump(payload)
    end

    it 'should return a ok http response' do
      expect(last_response).to be_ok
    end
  end
end
