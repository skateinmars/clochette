require 'spec_helper'

describe "Github WebHooks" do
  describe 'POST /hooks/github' do
    let(:payload) { JSON.dump({'payload' => 'test'}) }
    let(:events) { [{finish: 1}] }

    before do
      github_payload_mock = double('payload')
      expect(github_payload_mock).to receive(:events).and_return(events)

      github_payload_class_mock = double('github_payload')
      expect(github_payload_class_mock).
        to receive(:new).with(hash_including('payload' => payload)).
                          and_return(github_payload_mock)

      expect(Payload).to receive(:from_service).
        with('github').
        and_return(github_payload_class_mock)

      expect(EventDispatcher).to receive(:dispatch).with(events)

      post '/hooks/github', payload: payload
    end

    it 'should return a ok http response' do
      expect(response).to be_ok
    end
  end
end
