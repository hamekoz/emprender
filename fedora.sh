yum install -y git make gcc gcc-c++ gpp mod_passenger mysql-server mysql-devel ruby-devel rubygems rubygem-bundler rubygem-bcrypt-ruby libxml2-devel libxslt libxslt-devel

bundle install --deployment --without development test heroku

bundle exec rake emprender:config

systemctl enable mysqld.service
systemctl start mysqld.service

read -p "Ingrese el dominio del servidor: " hostname
sed -i -e 's!EMPRENDER_DOMINIO: "localhost"!EMPRENDER_DOMINIO: "'$hostname'"!' config/application.yml 1>/dev/null
sed -i -e 's!#EMPRENDER_DB!EMPRENDER_DB!' config/application.yml 1>/dev/null

read -p "¿Desea revisar el archivo de configuración? (s/n): " respuesta
case "$respuesta" in 
  s ) vi config/application.yml;;
  * ) ;;
esac

read -p "¿Desea revisar la configuración de respaldos? (s/n): " respuesta
case "$respuesta" in 
  s ) vi config/backup.rb;;
  * ) ;;
esac

bundle exec rake db:setup RAILS_ENV="production"

bundle exec rake assets:precompile

bundle exec rake emprender:backup_whenever

mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.ori
echo "" > /etc/httpd/conf.d/welcome.conf

cp -f emprender.conf /etc/httpd/conf.d/
sed -i -e 's!ServerName localhost!ServerName '$hostname'!' /etc/httpd/conf.d/emprender.conf 1>/dev/null

chown apache /var/www/html/emprender -R
chgrp apache /var/www/html/emprender -R

firewall-cmd --permanent --add-service=http
systemctl enable httpd.service
systemctl start httpd.service

echo "Felicitaciones Emprender se encuentra instalado en su servidor!!"
echo "Se creo un usuario administrador por defecto con las siguientes credenciales:"
echo ""
echo "Usuario: emprender@hamekoz.com.ar"
echo "Contraseña: admin123456"
echo ""
echo "Se le recomienda encarecidamente modificar, acorde a sus necesidades,"
echo "los datos de este usuario luego del primer ingreso."
