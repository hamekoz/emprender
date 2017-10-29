Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

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
