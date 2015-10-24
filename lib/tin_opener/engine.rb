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

    # config.paths.add "lib", eager_load: true
    # config.paths.add "app", eager_load: true
    # config.autoload_paths += Dir["#{config.root}/lib/**/"]
    # config.autoload_paths += Dir["#{config.root}/app/**/"]
  end
end
