require 'spec_helper'
require 'clochette/application'

describe Clochette::Application do
  describe 'GET /' do
    before do
      get '/'
    end

    it 'should return a ok http response' do
      expect(last_response).to be_ok
    end
  end
end
