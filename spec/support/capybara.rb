RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end
end
Capybara.default_driver = :rack_test
