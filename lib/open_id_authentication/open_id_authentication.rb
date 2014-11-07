module OpenIdAuthentication
  class Engine < Rails::Engine
    engine_name 'open_id_authentication'

    initializer 'open_id_authentication_engine.app_controller' do |app|
      ActiveSupport.on_load(:action_controller) do
        require File.expand_path('../../app/controllers/application_controller', __FILE__)
        require File.expand_path('../../app/helpers/application_helper', __FILE__)
      end
    end
  end
end
