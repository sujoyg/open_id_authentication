require 'spec_helper'

describe 'routes', :type => :routing do
  it 'routes GET /open_id/accept' do
    expect(open_id_accept_path).to eq '/open_id/accept'
    expect({get: '/open_id/accept'}).to route_to controller: 'open_id', action: 'accept'
  end

  it 'routes GET /open_id/connect' do
    expect(open_id_connect_path).to eq '/open_id/connect'
    expect({get: '/open_id/connect'}).to route_to controller: 'open_id', action: 'connect'
  end
end