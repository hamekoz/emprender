namespace :emprender do
  desc "Crea archivo de configuracion"
  task :config do
    puts "Creando archivo configuracion"
    sh "cp lib/templates/application.yml config/"
  end
end
