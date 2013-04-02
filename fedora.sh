yum install mod_passenger mysql-devel postgresql-devel ruby-devel rubygems rubygem-bundle
cd /var/www/html
git clone git://github.com/Hamekoz/emprender.git
chown apache emprender -R
chgrp apache emprender -R
cp config/application.template.yml config/application.yml
vi config/application.yml
bundle install --deployment --without development test heroku
bundle exec rake assets:precompile
mv /etc/http/conf.d/welcome.conf /etc/http/conf.d/welcome.conf.ori
echo "" > /etc/http/conf.d/welcome.conf
