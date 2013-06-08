namespace :emprender do
  desc "Realiza respaldo de configuracion, arhivos y datos de Emprender"
  task :backup do
    puts "Realizando respaldo"
    sh "backup perform --trigger emprender_backup --config_file config/backup.rb"
    puts "Respaldo completado"
  end

  desc "Crea tareas de respaldos automaticos con Cron"
  task :backup_whenever do
    sh "whenever -w"
  end

  desc "Actualiza tareas de respaldos automaticos con Cron"
  task :backup_renever do
    sh "whenever -i"
  end

  desc "Elimina tareas de respaldos automaticos con Cron"
  task :backup_never do
    sh "whenever -c"
  end
end
