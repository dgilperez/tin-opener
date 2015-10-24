module TinOpener
  class Engine < ::Rails::Engine
    isolate_namespace TinOpener

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.stylesheets     false
      g.javascripts     false
      g.helper          false

      g.view_specs       false
      g.helper_specs     false
      g.controller_specs false
    end
  end
end
