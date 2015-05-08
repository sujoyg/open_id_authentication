require 'spec_helper'

describe OpenIdController, :type => :controller do
  it { should have_skip_before_filter(:authorize) }

  describe 'GET accept' do
  end

  describe 'GET connect' do
    it 'should return a 401' do
      get :connect
      expect(response).to have_http_status(401)
    end
  end
end

