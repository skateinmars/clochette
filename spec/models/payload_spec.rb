require 'spec_helper'

describe Payload do
  describe '.from_service' do
    context 'given a service name' do
      let(:service_name) { 'github' }

      it 'should fetch the associated Payload class' do
        expect(Payload.from_service(service_name)).to eql(Payload::Github)
      end
    end
  end
end
