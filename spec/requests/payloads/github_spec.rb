require 'spec_helper'

describe "Github WebHooks" do
  describe 'POST /hooks/github' do
    let(:payload) { JSON.dump({'payload' => 'test'}) }
    let(:events) { [{finish: 1}] }

    context "given an existing project" do
      let!(:project) { FactoryGirl.create(:project) }

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

        expect(EventDispatcher).to receive(:dispatch).with(project, events)

        post "/hooks/#{project.uid}/github", payload: payload
      end

      it 'should return a ok http response' do
        expect(response).to be_ok
      end
    end

    context "given an unknown project" do
      let(:uid) { 'foobar' }

      it "should return an error" do
        expect(EventDispatcher).not_to receive(:dispatch)

        post "/hooks/#{uid}/github", payload: payload

        expect(response.status).to eql(404)
      end
    end
  end
end
