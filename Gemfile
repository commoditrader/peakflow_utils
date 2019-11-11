source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

group :development, :test do
  gem "best_practice_project"
  gem "capybara"
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "factory_bot_rails"
  gem "forgery"
  gem "globalize", git: "https://github.com/ma3tk/globalize.git", branch: "feature/update-rails-5-2"
  gem "money-rails"
  gem "pry-rails"
  gem "rails-controller-testing"
  gem "rspec-rails"
  gem "rubocop"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "rubocop-rspec"
  gem "sqlite3", platform: :ruby
end

# Declare your gem's dependencies in peak_flow_utils.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]
