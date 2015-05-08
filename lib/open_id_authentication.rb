require 'rack/openid'

module OpenIdAuthentication
  class Engine < Rails::Engine
    initializer 'open_id_authentication_engine.add_middleware' do |app|
      app.middleware.use 'Rack::OpenID'
    end
  end
end
