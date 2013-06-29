# encoding: utf-8

##
# Backup Generated: emprender_backup
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t emprender_backup [-c <path_to_configuration_file>]
#

RAILS_ENV    = ENV['RAILS_ENV'] || 'development'

Backup::Model.new(:emprender_backup, 'Respaldo de Emprender') do
  ##
  # Split [Splitter]
  #
  # Split the backup file in to chunks of 250 megabytes
  # if the backup file size exceeds 250 megabytes
  #
  # split_into_chunks_of 250
  ##
  # Archive [Archive]
  #
  # Adding a file or directory (including sub-directories):
  #   archive.add "/path/to/a/file.rb"
  #   archive.add "/path/to/a/directory/"
  #
  # Excluding a file or directory (including sub-directories):
  #   archive.exclude "/path/to/an/excluded_file.rb"
  #   archive.exclude "/path/to/an/excluded_directory
  #
  # By default, relative paths will be relative to the directory
  # where `backup perform` is executed, and they will be expanded
  # to the root of the filesystem when added to the archive.
  #
  # If a `root` path is set, relative paths will be relative to the
  # given `root` path and will not be expanded when added to the archive.
  #
  #   archive.root '/path/to/archive/root'
  #
  # For more details, please see:
  # https://github.com/meskyanichi/backup/wiki/Archives
  #
  archive :emprender_datos do |archive|
    # Run the `tar` command using `sudo`
    # archive.use_sudo
    archive.root '.'
    archive.add "db/"
    archive.add "public/"
  end

  archive :emprender_config do |archive|
    # Run the `tar` command using `sudo`
    # archive.use_sudo
    archive.root '.'
    archive.add "config/application.yml"
    archive.add "config/backup.rb"
    archive.add "config/schedule.rb"
    archive.add "/etc/httpd/conf.d/emprender.conf"
  end

  archive :emprender_logs do |archive|
    # Run the `tar` command using `sudo`
    # archive.use_sudo
    archive.root '.'
    archive.add "log/"
  end



  ##
  # MySQL [Database]
  #
  puts "Variable de entorno"
  puts RAILS_ENV
  if RAILS_ENV == 'production'
    database MySQL do |db|
      db.name               = ENV["EMPRENDER_DB_DABABASE"]
      db.username           = ENV["EMPRENDER_DB_USUARIO"]
      db.password           = ENV["EMPRENDER_DB_PASSWORD"]
      db.host               = "localhost"
      db.port               = 3306
      db.socket             = ENV["EMPRENDER_DB_SOCKET"]
    end
  end

compress_with Gzip

  ##
  # SCP (Secure Copy) [Storage]
  #
#  store_with SCP do |server|
#    server.username   = "my_username"
#    server.password   = "my_password"
#    server.ip         = "123.45.678.90"
#    server.port       = 22
#    server.path       = "~/backups/"
#    server.keep       = 5
#  end

  ##
  # SFTP (Secure File Transfer Protocol) [Storage]
  #
#  store_with SFTP do |server|
#    server.username   = "my_username"
#    server.password   = "my_password"
#    server.ip         = "123.45.678.90"
#    server.port       = 22
#    server.path       = "~/backups/"
#    server.keep       = 5
#  end

  ##
  # Local (Copy) [Storage]
  #
  store_with Local do |local|
    local.path       = ENV["EMPRENDER_BACKUP_DESTINO_LOCAL"] || "~/backups/"
    local.keep       = 5
  end

  ##
  # Mail [Notifier]
  #
  # The default delivery method for Mail Notifiers is 'SMTP'.
  # See the Wiki for other delivery options.
  # https://github.com/meskyanichi/backup/wiki/Notifiers
  #
  notify_by Mail do |mail|
    mail.on_success           = true
    mail.on_warning           = true
    mail.on_failure           = true

    mail.from                 = ENV["EMPRENDER_MAIL_USUARIO"]
    mail.to                   = ENV["EMPRENDER_BACKUP_MAIL"]
    mail.address              = ENV["EMPRENDER_MAIL_SERVIDOR"]
    mail.port                 = ENV["EMPRENDER_MAIL_PUERTO"]
    mail.domain               = ENV["EMPRENDER_MAIL_DOMINIO"]
    mail.user_name            = ENV["EMPRENDER_MAIL_USUARIO"]
    mail.password             = ENV["EMPRENDER_MAIL_PASSWORD"]
    mail.authentication       = "plain"
    mail.encryption           = :starttls
  end

end
