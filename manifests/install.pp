# Class: elasticsearch::install
#
# Install elasticsearch
#

class elasticsearch::install (
  $ensure = $elasticsearch::params::ensure,
) inherits elasticsearch::params {
  package { 'elasticsearch': 
    ensure          => $ensure,
    install_options => ['--no-install-recommends'],
  }
}

# vi: set ft=puppet expandtab shiftwidth=2 tabstop=2 :
