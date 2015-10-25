$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tin_opener/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tin_opener"
  s.version     = TinOpener::VERSION
  s.authors     = ["David Gil"]
  s.email       = ["dgilperez@gmail.com"]
  s.homepage    = ""
  s.summary     = "Opening Data, one Tin at a time"
  s.description = "A Rails Engine for Ayuntamiento de Madrid's Open Data site"
  s.license     = "GNU AFFERO GENERAL PUBLIC LICENSE"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.4"
  s.add_dependency "pg"
  s.add_dependency "activerecord-import", '~> 0.10'

  s.add_development_dependency 'pry-byebug'
  s.add_development_dependency 'spring'
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "spring-commands-rspec"
  s.add_development_dependency "capybara"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "shoulda-matchers", '~> 3.0'
end
