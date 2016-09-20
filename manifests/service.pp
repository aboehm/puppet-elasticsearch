# Class: elasticsearch::service
#
# manage service definition of elasticsearch
#

class elasticsearch::service (
  $enable  = $elasticsearch::params::enable,
  $running = $elasticsearch::params::running,
) inherits elasticsearch::params {
  service { 'elasticsearch':
    enable => $enable,
    ensure => $running,
  }
}

# vi: set ft=puppet expandtab shiftwidth=2 tabstop=2 :
