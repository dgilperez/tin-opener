$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tin_opener/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tin_opener"
  s.version     = TinOpener::VERSION
  s.authors     = ["David Gil"]
  s.email       = ["dgilperez@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of TinOpener."
  s.description = "TODO: Description of TinOpener."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"
  s.add_dependency "pg"

  s.add_dependency 'spring'
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "spring-commands-rspec"
  s.add_development_dependency "factory_girl_rails"
end
