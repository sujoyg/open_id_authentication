OpenID authentication engine requires Rails 4.1.0 or above.

### Installing the engine:

* Add the following to the `Gemfile`<br>
  `gem 'open_id_authentication', '0.0.1'`
* Run `bundle install`

### Configuring the application:

Add the following to `config/application.rb`:<br>
`config.railties_order = [OpenIdAuthentication::Engine, :main_app, :all]`<br>
as the first line after<br>
`class Application < Rails::Application`
