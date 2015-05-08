$:.push File.expand_path("../lib", __FILE__)

require "open_id_authentication/version"

Gem::Specification.new do |s|
  s.name        = "open_id_authentication"
  s.version     = OpenIdAuthentication::VERSION
  s.authors     = ["Sujoy Gupta"]
  s.email       = ["sujoyg@gmail.com"]
  s.homepage    = "http://github.com/sujoyg/open_id_authentication"
  s.summary     = "A Rails engine for OpenId based user authentication."
  s.description = "A Rails engine for OpenId based user authentication."
  s.license     = 'MIT'
  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile"]

  s.add_dependency "bcrypt", "~> 3.1"
  s.add_dependency "rails", "~> 4.1"
  s.add_dependency "rack-openid", "~> 1.4"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 3.2"
  s.add_development_dependency "factory_girl_rails", "~> 4.1"
  s.add_development_dependency "specstar-support-random", "~> 0.1"
  s.add_development_dependency "specstar-controllers", "~> 0.1"
  s.add_development_dependency "capybara", "~> 2.4"
end
