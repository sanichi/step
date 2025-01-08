source 'https://rubygems.org'

gem 'rails', '8.0.1'
gem 'haml-rails', '~> 2.0'
gem 'sassc-rails', '~> 2.1'
gem 'bootstrap', '~> 5.0'
gem 'meta-tags', '~> 2.12'
gem 'sprockets-rails', '~> 3.4'
gem 'importmap-rails', '~> 2.1'
gem "turbo-rails", "~> 2.0"

# Temporary fix
gem "nokogiri", force_ruby_platform: true

group :development, :test do
  gem 'rspec-rails', '< 8'
  gem 'capybara', '~> 3.28'
  gem 'byebug', platforms: :mri
  gem 'launchy'
end

group :development do
  gem 'puma', '< 7'
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-passenger', '~> 0.2', require: false
  gem 'listen', '~> 3.2'
end

group :production do
  gem 'terser', '~> 1.1'
end
