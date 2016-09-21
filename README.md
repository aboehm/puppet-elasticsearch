# elasticsearch

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What elasticsearch affects](#what-elasticsearch-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with elasticsearch](#beginning-with-elasticsearch)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)

## Overview

Puppet module for managing elasticsearch.

## Module Description

Manage installation, configuration and service definition of elasticsearch.

## Setup

### What elasticsearch affects

* installs the elastic package maintainer key from elastic.co
* add elasticsearch repository
* installs/helds/remove elasticsearch package
* place/remove elasticsearch configuration file
* activate/deactivate and starts/stop elasticsearch service

### Setup Requirements

* aboehm/elastic (https://github.com/aboehm/puppet-elastic)
* puppetlabs/apt (https://forge.puppet.com/puppetlabs/apt)
* puppetlabs/java (https://forge.puppet.com/puppetlabs/java)
* puppetlabs/stdlib (https://forge.puppet.com/puppetlabs/stdlib)

### Beginning with elasticsearch

To do a simple installation, define as follows

~~~
class { 'elasticsearch':
}
~~~

To remove:

~~~
class { 'elasticsearch':
  ensure => absent
}
~~~

For further configuration details, look into `elasticsearch::config`.

## Usage

Include elasticsearch module and configure with hiera.

## Reference

* `elasticsearch`: Define behavior of elasticsearch
* `elasticsearch::config`: Declare actions for configuration files
* `elasticsearch::install`: Install/remove package
* `elasticsearch::params`: Basic parameters of module
* `elasticsearch::repo`: Manage repository
* `elasticsearch::service`: Service management

## Limitations

Only Debian/Ubuntu are supported.


