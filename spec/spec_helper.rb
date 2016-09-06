require "capybara/rspec"
require 'capybara-screenshot/rspec'

Capybara.register_driver :selenium  do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
  config.javascript_driver = :selenium
  config.save_path = "/screens"
  config.default_max_wait_time = 30
end

Capybara::Screenshot.register_driver(:firefox) do |driver, path|
  driver.browser.save_screenshot(path)
end

RSpec.configure do |c|
  c.include Capybara::DSL, feature: true
  c.include Capybara::RSpecMatchers, feature: true
  c.formatter = :documentation
  c.color = true
  c.tty = true
  c.append_after(:each) do
    page.driver.reset!
  end
end
