RSpec.configure do |config|
  # config.before :each, type: :feature do
  #   helper.class.include TinOpener::Engine.routes.url_helpers
  # end

  config.include TinOpener::Engine.routes.url_helpers, type: :feature
end
