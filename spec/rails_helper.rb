require 'simplecov'
SimpleCov.start
# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
end

def test_data
  @bachelorette_1 = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The Most Dramatic Season Yet!")
  @bachelorette_2 = Bachelorette.create!(name: "Rachel Lindsay", season_number: 13, season_description: "The Wildest One!")

  @contestant_1 = @bachelorette_1.contestants.create!(name: "Chad Smith", age: 25, hometown: "Denver, CO")
  @contestant_2 = @bachelorette_1.contestants.create!(name: "Peter Weber", age: 28, hometown: "Los Angeles, CA")
  @contestant_3 = @bachelorette_1.contestants.create!(name: "Tyler Cameron", age: 26, hometown: "Denver, CO")
  @contestant_4 = @bachelorette_2.contestants.create!(name: "Eric Bigger", age: 30, hometown: "Chicago, IL")
  @contestant_5 = @bachelorette_2.contestants.create!(name: "Wills Reid", age: 28, hometown: "New York, NY")
  @contestant_6 = @bachelorette_2.contestants.create!(name: "Mike Johnson", age: 29, hometown: "Dallas, TX")

  @outing_1 = Outing.create!(name: "Helicopter Ride", location: "Bali", date: "2019-12-19")
  @outing_2 = Outing.create!(name: "Hot Air Balloon Ride", location: "Paris", date: "2019-12-20")
  @outing_3 = Outing.create!(name: "Boat Ride", location: "Venice", date: "2019-12-21")
  @outing_4 = Outing.create!(name: "Horseback Riding", location: "Rome", date: "2019-12-22")

  @contestant_outing_1 = ContestantOuting.create!(outing: @outing_1, contestant: @contestant_1)
  @contestant_outing_2 = ContestantOuting.create!(outing: @outing_1, contestant: @contestant_2)
  @contestant_outing_3 = ContestantOuting.create!(outing: @outing_1, contestant: @contestant_3)
  @contestant_outing_4 = ContestantOuting.create!(outing: @outing_2, contestant: @contestant_1)
  @contestant_outing_5 = ContestantOuting.create!(outing: @outing_2, contestant: @contestant_2)
  @contestant_outing_6 = ContestantOuting.create!(outing: @outing_3, contestant: @contestant_1)
end
