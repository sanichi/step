source 'https://rubygems.org'

gem 'rails', '7.1.2'
gem 'haml-rails', '~> 2.0'
gem 'jquery-rails', '~> 4.3'
gem 'sassc-rails', '~> 2.1'
gem 'bootstrap', '~> 5.0'
gem 'meta-tags', '~> 2.12'
gem 'sprockets-rails', '~> 3.4'

group :development, :test do
  gem 'rspec-rails', '< 7'
  gem 'capybara', '~> 3.28'
  gem 'byebug', platforms: :mri
  gem 'launchy', '~> 2.5'
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
