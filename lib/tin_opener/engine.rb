module TinOpener
  class Engine < ::Rails::Engine
    isolate_namespace TinOpener

    config.generators do |g|
      g.test_framework :rspec, view_specs: false, controller_specs: false,
        routing_specs: false, helper_specs: false, request_specs: false
      g.integration_tool :rspec
      g.fixture_replacement :factory_girl, dir: 'spec/factories'

      g.stylesheets     false
      g.javascripts     false
      g.helper          false
    end
  end
end
