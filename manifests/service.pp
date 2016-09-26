# == Class: elasticsearch::service
#
# Service management.
#
# === Authors
#
# Alexander Böhm <alxndr.boehm@gmail.com>
#
# === Copyright
#
# Copyright 2016 Alexander Böhm
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
