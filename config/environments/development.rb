Emprender::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  # Google Analytics id
  if ENV["EMPRENDER_GOOGLE_ANALYTICS_ID"].present?
    GA.tracker = ENV["EMPRENDER_GOOGLE_ANALYTICS_ID"]
  end

  config.action_mailer.default_url_options = { :host => ENV["EMPRENDER_DOMINIO"] }

  if ENV["EMPRENDER_MAIL_SMTP"] == "enable"
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      :address              => ENV["EMPRENDER_MAIL_SERVIDOR"],
      :port                 => ENV["EMPRENDER_MAIL_PUERTO"],
      :domain               => ENV["EMPRENDER_MAIL_DOMINIO"],
      :user_name            => ENV["EMPRENDER_MAIL_USUARIO"],
      :password             => ENV["EMPRENDER_MAIL_PASSWORD"],
      :authentication       => :plain,
      :enable_starttls_auto => true
    }
  else
    config.action_mailer.delivery_method = :sendmail
  end

  if ENV["EMPRENDER_DROPBOX"] == "enable"
    config.paperclip_defaults = {
      :storage => :dropbox,
      :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
      :dropbox_options => { :download => ENV["EMPRENDER_DROPBOX_ACCESS_TYPE"] == "dropbox",
                            :unique_filename => true }
    }
  end
end
