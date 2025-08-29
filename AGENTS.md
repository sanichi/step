# Agent Guidelines for Step Conference Rails App

## Build/Test Commands
- **Test all**: `bin/rspec` or `bundle exec rspec`
- **Test single file**: `bin/rspec spec/features/pages_spec.rb`
- **Test single spec**: `bin/rspec spec/features/pages_spec.rb:9`
- **Development server**: `bin/dev` or `bin/rails server`
- **Rails console**: `bin/rails console`
- **Setup**: `bin/setup`

## Code Style Guidelines
- **Framework**: Rails 8.0.2.1 with HAML views, SASS stylesheets, RSpec tests
- **Naming**: snake_case for methods/variables, CamelCase for classes, kebab-case for routes
- **Controllers**: Keep minimal, delegate logic to models when possible
- **Models**: Use plain Ruby classes or Rails models, prefer class methods for utilities
- **Views**: Use HAML syntax with proper indentation, leverage Rails helpers
- **Tests**: Feature tests with Capybara, use `t()` helper for I18n, `js: true` for JavaScript tests
- **Routes**: Use dynamic route generation with arrays/ranges for similar paths
- **File organization**: Follow Rails conventions (controllers/, models/, views/, spec/)
- **Error handling**: Use Rails built-in error handling and validation patterns
- **Dependencies**: Only use gems already in Gemfile (haml-rails, bootstrap, meta-tags, etc.)