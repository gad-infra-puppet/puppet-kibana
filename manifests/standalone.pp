# == Class: kibana::standalone
#
# This class is able to install or remove kibana on a node.
# It manages the status of the related service.
#
#
#
# === Parameters
#
#
#
# === Examples
#
#
#
# === Authors
#
# * Richard Pijnenburg <mailto:richard@ispavailability.com>
#
class kibana::standalone( )
inherits kibana::params {

  if $kibana::standalone == true {
  # packages
  case $::operatingsystem {
    'Debian', 'Ubuntu': {
      # main application
      $init_file = 'kibana.debian' 
    }
    default: {
      $init_file = 'kibana' 
    }
  }
    file { '/etc/init.d/kibana':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
      source => "puppet:///modules/${module_name}/etc/init.d/${init_file}"
    }

  }


}
