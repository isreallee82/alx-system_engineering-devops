<<<<<<< HEAD
# Custom HTTP header in a nginx server

# update ubuntu server
exec { 'update server':
  command  => 'apt-get update',
  user     => 'root',
  provider => 'shell',
}
->
# install nginx web server on server
package { 'nginx':
  ensure   => present,
  provider => 'apt'
}
->
# custom Nginx response header (X-Served-By: hostname)
file_line { 'add HTTP header':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'add_header X-Served-By $hostname;'
}
->
# start service
service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx']
=======
# Automation: creates a custom HTTP header response with Puppet.
exec { 'command':
  command  => 'apt-get -y update;
  apt-get -y install nginx;
  sudo sed -i "/listen 80 default_server;/a add_header X-Served-By $HOSTNAME;" /etc/nginx/sites-available/default;
  service nginx restart',
  provider => shell,
>>>>>>> 8b827427fdbd642288adc8d38d4e0151df15a02a
}
