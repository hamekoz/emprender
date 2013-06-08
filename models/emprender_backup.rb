# encoding: utf-8

##
# Backup Generated: emprender_backup
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t emprender_backup [-c <path_to_configuration_file>]
#
Backup::Model.new(:emprender_backup, 'Description for emprender_backup') do
  ##
  # Split [Splitter]
  #
  # Split the backup file in to chunks of 250 megabytes
  # if the backup file size exceeds 250 megabytes
  #
  split_into_chunks_of 250
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
  archive :my_archive do |archive|
    # Run the `tar` command using `sudo`
    # archive.use_sudo
    archive.add "/path/to/a/file.rb"
    archive.add "/path/to/a/folder/"
    archive.exclude "/path/to/a/excluded_file.rb"
    archive.exclude "/path/to/a/excluded_folder"
  end

  ##
  # MySQL [Database]
  #
  database MySQL do |db|
    # To dump all databases, set `db.name = :all` (or leave blank)
    db.name               = "my_database_name"
    db.username           = "my_username"
    db.password           = "my_password"
    db.host               = "localhost"
    db.port               = 3306
    db.socket             = "/tmp/mysql.sock"
    # Note: when using `skip_tables` with the `db.name = :all` option,
    # table names should be prefixed with a database name.
    # e.g. ["db_name.table_to_skip", ...]
    db.skip_tables        = ["skip", "these", "tables"]
    db.only_tables        = ["only", "these", "tables"]
    db.additional_options = ["--quick", "--single-transaction"]
  end

  ##
  # PostgreSQL [Database]
  #
  database PostgreSQL do |db|
    # To dump all databases, set `db.name = :all` (or leave blank)
    db.name               = "my_database_name"
    db.username           = "my_username"
    db.password           = "my_password"
    db.host               = "localhost"
    db.port               = 5432
    db.socket             = "/tmp/pg.sock"
    # When dumping all databases, `skip_tables` and `only_tables` are ignored.
    db.skip_tables        = ["skip", "these", "tables"]
    db.only_tables        = ["only", "these", "tables"]
    db.additional_options = ["-xc", "-E=utf8"]
  end

  ##
  # Local (Copy) [Storage]
  #
  store_with Local do |local|
    local.path       = "~/backups/"
    local.keep       = 5
  end

  ##
  # Dropbox File Hosting Service [Storage]
  #
  # Access Type:
  #
  #  - :app_folder (Default)
  #  - :dropbox
  #
  # Note:
  #
  #  Initial backup must be performed manually to authorize
  #  this machine with your Dropbox account.
  #
  store_with Dropbox do |db|
    db.api_key     = "my_api_key"
    db.api_secret  = "my_api_secret"
    db.access_type = :app_folder
    db.path        = "/path/to/my/backups"
    db.keep        = 25
  end

  ##
  # FTP (File Transfer Protocol) [Storage]
  #
  store_with FTP do |server|
    server.username     = "my_username"
    server.password     = "my_password"
    server.ip           = "123.45.678.90"
    server.port         = 21
    server.path         = "~/backups/"
    server.keep         = 5
    server.passive_mode = false
  end

  ##
  # RSync [Storage]
  #
  # The default `mode` is :ssh, which does not require the use
  # of an rsync daemon on the remote. If you wish to connect
  # directly to an rsync daemon, or via SSH using daemon features,
  # :rsync_daemon and :ssh_daemon modes are also available.
  #
  # If no `host` is specified, the transfer will be a local
  # operation. `mode` and `compress` will have no meaning.
  #
  # See the documentation on the Wiki for details.
  # https://github.com/meskyanichi/backup/wiki/Storages
  store_with RSync do |rsync|
    rsync.mode      = :ssh
    rsync.host      = "123.45.678.90"
    rsync.path      = "~/backups/"
    rsync.compress  = true
  end

  ##
  # SCP (Secure Copy) [Storage]
  #
  store_with SCP do |server|
    server.username   = "my_username"
    server.password   = "my_password"
    server.ip         = "123.45.678.90"
    server.port       = 22
    server.path       = "~/backups/"
    server.keep       = 5
  end

  ##
  # SFTP (Secure File Transfer Protocol) [Storage]
  #
  store_with SFTP do |server|
    server.username   = "my_username"
    server.password   = "my_password"
    server.ip         = "123.45.678.90"
    server.port       = 22
    server.path       = "~/backups/"
    server.keep       = 5
  end

  ##
  # RSync::Local [Syncer]
  #
  sync_with RSync::Local do |rsync|
    rsync.path     = "~/backups"
    rsync.mirror   = true

    rsync.directories do |directory|
      directory.add "/var/apps/my_app/public/uploads"
      directory.add "/var/apps/my_app/logs"
    end
  end

  ##
  # RSync::Push [Syncer]
  #
  # The default `mode` is :ssh, which does not require the use
  # of an rsync daemon on the remote. If you wish to connect
  # directly to an rsync daemon, or via SSH using daemon features,
  # :rsync_daemon and :ssh_daemon modes are also available.
  # See the documentation on the Wiki for details.
  # https://github.com/meskyanichi/backup/wiki/Syncers
  #
  sync_with RSync::Push do |rsync|
    rsync.mode     = :ssh
    rsync.host     = "123.45.678.90"
    rsync.path     = "~/backups"
    rsync.mirror   = true
    rsync.compress = true

    rsync.directories do |directory|
      directory.add "/var/apps/my_app/public/uploads"
      directory.add "/var/apps/my_app/logs"
    end
  end

  ##
  # Gzip [Compressor]
  #
  compress_with Gzip

  ##
  # Lzma [Compressor]
  #
  # [DEPRECATED]
  # See the Wiki for more info.
  # https://github.com/meskyanichi/backup/wiki/Compressors
  compress_with Lzma do |compression|
    compression.best = true
    compression.fast = false
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

    mail.from                 = "sender@email.com"
    mail.to                   = "receiver@email.com"
    mail.address              = "smtp.gmail.com"
    mail.port                 = 587
    mail.domain               = "your.host.name"
    mail.user_name            = "sender@email.com"
    mail.password             = "my_password"
    mail.authentication       = "plain"
    mail.encryption           = :starttls
  end

end
