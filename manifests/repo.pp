# == Class: elasticsearch::repo
#
# Repository management.
#
# === Authors
#
# Alexander Böhm <alxndr.boehm@gmail.com>
#
# === Copyright
#
# Copyright 2016 Alexander Böhm
#

class elasticsearch::repo (
  $ensure      = $elasticsearch::params::ensure,
  $release     = $elasticsearch::params::release,
  $include_src = $elasticsearch::params::include_src,
) {
  $ea = $ensure ? {
    /present|install|latest/ => 'file',
    /purged|absent/          => 'absent',
    default                  => false,
  }

  if $ea != false {
    apt::source { 'elasticsearch':
      ensure   => $ea,
      location => "http://packages.elastic.co/elasticsearch/${release}/debian",
      release  => 'stable',
      repos    => 'main',
      include  => {
        src => $include_src,
      },
    }
  }
}

# vi: set ft=puppet expandtab shiftwidth=2 tabstop=2 :
