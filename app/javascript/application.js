// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"

// Start Turbo disabled until we explcitly opt-in (with data-turbo => true on some element).
Turbo.session.drive = false
