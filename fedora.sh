#Instalando paquetes necesarios
yum install -y git make gcc gcc-c++ gpp mod_passenger mysql-server mysql-devel ruby-devel rubygems rubygem-bundler rubygem-bcrypt-ruby libxml2-devel libxslt libxslt-devel
#Desabilitando SELinux
setenforce 0
