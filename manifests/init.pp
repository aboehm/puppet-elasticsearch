# == Class: elasticsearch
#
# Management of elasticsearch installation.
#
# === Authors
#
# Alexander Böhm <alxndr.boehm@gmail.com>
#
# === Copyright
#
# Copyright 2016 Alexander Böhm
#

class elasticsearch (
  $ensure    = $elasticsearch::params::ensure,
  $enable    = $elasticsearch::params::enable,
  $running   = $elasticsearch::params::running,
  $release   = $elasticsearch::params::release,
) inherits elasticsearch::params {

  validate_re($ensure, 'present|installed|purged|absent|held|latest')
  validate_bool($enable, true, false)
  validate_re($running, 'running|stopped')

  include elastic
  include java

  anchor { 'elasticsearch::begin': } ->
  Class['elastic::repo'] ->
  Class['apt::update'] ->
  Class['java'] ->
  Class['elasticsearch::install'] ->
  Class['elasticsearch::config'] ->
  Class['elasticsearch::service'] ->
  anchor { 'elasticsearch::end': }

  ensure_resource( 'class', 'elasticsearch::install', {
    ensure => $ensure,
  } )

  ensure_resource( 'class', 'elasticsearch::config', {
    ensure    => $ensure,
  } )

  ensure_resource( 'class', 'elasticsearch::service', {
    enable        => $enable,
    running       => $running,
  } )
}

# vi: set ft=puppet expandtab shiftwidth=2 tabstop=2 :
