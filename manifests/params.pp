# == Class: elasticsearch::params
#
# Definition of standard parameters.
#
# === Authors
#
# Alexander Böhm <alxndr.boehm@gmail.com>
#
# === Copyright
#
# Copyright 2016 Alexander Böhm
#

class elasticsearch::params {
  $ensure            = present
  $enable            = true
  $release           = "2.x"
  $running           = running

  if (0 + $::memorysize_mb) >= 32768 {
    $heap_size = "31g"
  } else {
    $suggest_size = $::memorysize_mb * 0.90
    $heap_size = inline_template("<%= @suggest_size.to_i %>m")
  }

  $include_src       = false

  $config            = "/etc/elasticsearch/elasticsearch.yml"
  $startup_config    = "/etc/default/elasticsearch"
  $config_file_mode  = '0640'
  $user              = "elasticsearch"
  $group             = "elasticsearch"

  $node_rack         = "rack"
  $node_name         = $::fqdn
  $cluster_name      = $trusted['domain']
  $master_node       = true
  $data_node         = true

  $index_shards      = 5
  $index_replicas    = 1
  $index_refresh     = "100"

  $interface         = "127.0.0.1"
  $http_enable       = true
  $zen_discovery     = false
  $default_tokenizer = "keyword"
}

# vi: set ft=puppet expandtab shiftwidth=2 tabstop=2 :
