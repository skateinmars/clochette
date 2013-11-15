require 'spec_helper'

describe "Github WebHooks" do
  describe 'POST /github' do
    let(:payload) { {'payload' => 'test'} }
    let(:actions) { [{finish: 1}] }

    before do
      github_payload_mock = double('payload')
      expect(github_payload_mock).to receive(:actions).and_return(actions)

      expect(Payload::Github).to receive(:new).
                                              with(payload).
                                              and_return(github_payload_mock)

      expect(Hook).to receive(:trigger).with(actions)

      post '/github', payload: JSON.dump(payload)
    end

    it 'should return a ok http response' do
      expect(response).to be_ok
    end
  end
end
