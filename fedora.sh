yum install mod_passenger mysql-server mysql-devel postgresql-devel ruby-devel rubygems rubygem-bundler
cd /var/www/html
git clone git://github.com/Hamekoz/emprender.git
cd emprender
cp config/application.template.yml config/application.yml

read -p "Ingrese el dominio del servidor: " hostname
sed -i -e 's!EMPRENDER_DOMINIO: "localhost"!EMPRENDER_DOMINIO: "'$hostname'"!' config/application.yml 1>/dev/null

systemctl enable mysqld.service
systemctl start mysqld.service

sed -i -e 's!#EMPRENDER_DB!EMPRENDER_DB!' config/application.yml 1>/dev/null

bundle install --deployment --without development test heroku

bundle exec rake db:setup RAILS_ENV="production"

bundle exec rake assets:precompile

mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.ori
echo "" > /etc/httpd/conf.d/welcome.conf

cp -f emprender.conf /etc/httpd/conf.d/
sed -i -e 's!ServerName localhost!ServerName '$hostname'!' /etc/httpd/conf.d/emprender.conf 1>/dev/null

chown apache /var/www/html/emprender -R
chgrp apache /var/www/html/emprender -R

systemctl enable httpd.service
systemctl start httpd.service

read -p "¿Desea revisar el archivo de configuración? (s/n): " respuesta
case "$respuesta" in 
  s ) vi config/application.yml;;
  * ) ;;
esac

echo "Felicitaciones Emprender se encuentra instalado en su servidor!!"
echo "Se creo un usuario administrador por defecto con las siguientes credenciales:"
echo ""
echo "Usuario: emprender@hamekoz.com.ar"
echo "Contraseña: admin123456"
echo ""
echo "Se le recomienda encarecidamente modificar, acorde a sus necesidades,"
echo "los datos de este usuario luego del primer ingreso."
