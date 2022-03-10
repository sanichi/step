# Be sure to restart your server when you modify this file.
Rails.application.config.session_store :cookie_store,
  key: "#{Rails.env.production? ? '__Secure-' : ''}Step-Session",
  expire_after: 4.weeks
