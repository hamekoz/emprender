Emprender::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = true

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Generate digests for assets URLs
  config.assets.digest = false

  # Defaults to nil and saved in location specified by config.assets.prefix
  # config.assets.manifest = YOUR_PATH

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Prepend all log lines with the following tags
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  config.assets.precompile += %w( pdf.css)
  config.assets.precompile += %w( pdf.js)

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  # config.active_record.auto_explain_threshold_in_seconds = 0.5

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
