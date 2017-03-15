# == Class: elasticsearch::config
#
# Configures elasticsearch.
#
# === Authors
#
# Alexander Böhm <alxndr.boehm@gmail.com>
#
# === Copyright
#
# Copyright 2016 Alexander Böhm
#

class elasticsearch::config (
  $ensure            = $elasticsearch::params::ensure,

  $config            = $elasticsearch::params::config,
  $config_file_mode  = $elasticsearch::params::config_file_mode,
  $startup_config    = $elasticsearch::params::startup_config,

  $node_rack         = $elasticsearch::params::node_rack,
  $node_name         = $::fqdn,
  $cluster_name      = $elasticsearch::params::cluster_name,
  $master_node       = $elasticsearch::params::master_node,
  $data_node         = $elasticsearch::params::data_node,

  $index_shards      = $elasticsearch::params::index_shards,
  $index_replicas    = $elasticsearch::params::index_replicas,
  $index_refresh     = $elasticsearch::params::index_refresh,

  $interface               = $elasticsearch::params::interface,

  $http_enable             = $elasticsearch::params::http_enable,
  $http_port               = $elasticsearch::params::http_port,
  $http_interface          = $elasticsearch::params::http_interface,
  $http_cors               = $elasticsearch::params::http_cors,
  $http_cors_origin        = $elasticsearch::params::http_cors_origin,

  $zen_discovery_min_hosts = $elasticsearch::params::zen_discovery_min_hosts,

  $memory_lock	           = $elasticsearch::params::memory_lock,

  $default_tokenizer       = $elasticsearch::params::default_tokenizer,

  $user              = $elasticsearch::params::user,
  $group             = $elasticsearch::params::group,
) {

  validate_re($ensure, 'present|installed|purged|absent|held|latest')
  validate_bool($http_enable, true, false)

  if $ensure =~ /present|installed|latest/ {
    $ef = 'file'
  } elsif $ensure =~ /purged|absent/ {
    $ef = 'absent'
  } else {
    $ef = false
  }

  if $ef != false {
    file { $config:
      ensure  => $ef,
      mode    => $config_file_mode,
      owner   => $user,
      group   => $group,
      content => template("elasticsearch/elasticsearch.yml"),
      notify  => Service['elasticsearch'],
    }

    file { $startup_config:
      ensure => $ef,
      mode   => $config_file_mode,
      owner  => $user,
      group  => $group,
      content => template("elasticsearch/elasticsearch-default"),
      notify  => Service['elasticsearch'],
    }
  }
}

# vi: set ft=puppet expandtab shiftwidth=2 tabstop=2 :
