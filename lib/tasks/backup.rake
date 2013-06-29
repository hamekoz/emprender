namespace :emprender do
  desc "Realiza respaldo de configuracion, arhivos y datos de Emprender"
  task :backup do
    puts "Realizando respaldo"
    sh "backup perform --trigger emprender_backup --config_file config/backup.rb"
  end

  namespace :backup do
    desc "Crea tareas de respaldos automaticos con Cron"
    task :whenever do
      sh "whenever -w"
    end

    desc "Actualiza tareas de respaldos automaticos con Cron"
    task :renever do
      sh "whenever -i"
    end

    desc "Elimina tareas de respaldos automaticos con Cron"
    task :never do
      sh "whenever -c"
    end
  end
  
  namespace :restaurar do
    desc "Descomprimir y preprar archivos para restauracion"
    task :preparar, [:ruta_archivo_backup] do  |t, args|
      puts "Descomprimir archivo #{args.ruta_archivo_backup} en /tmp"
      sh "tar -xvf #{args.ruta_archivo_backup} -C /tmp/"
    end

    desc "Restaurar todos los respaldos"
    task :todo do
      puts "Restaurando logs, datos, configuracion y base de datos"
      Rake::Task[:logs].invoke
      Rake::Task[:config].invoke
      Rake::Task[:datos].invoke
      Rake::Task[:basededatos].invoke
    end

    desc "Restaurar arhivos de registros log"
    task :logs do
      puts "Restaurando archivos de registros log"
      sh "tar -xvPf /tmp/emprender_backup/archives/emprender_logs.tar.gz -C ."
    end

    desc "Restaurar archivos de configuracion"
    task :config do
      puts "Restaurando archivos de configuracion"
      sh "tar -xvPf /tmp/emprender_backup/archives/emprender_config.tar.gz -C ."
    end

    desc "Restaurar archivos de datos"
    task :datos do
      puts "Restaurando archivos de datos"
      sh "tar -xvPf /tmp/emprender_backup/archives/emprender_datos.tar.gz -C ."
    end

    desc "Restaurar base de datos"
    task :basededatos do
      puts "Restaurando base de datos"
      sh "gunzip < /tmp/emprender_backup/databases/MySql.sql.gz | mysql -u #{ENV["EMPRENDER_DB_USUARIO"]} -p #{ENV["EMPRENDER_DB_PASSWORD"]} #{ENV["EMPRENDER_DB_DABABASE"]}"
    end
  end
end
