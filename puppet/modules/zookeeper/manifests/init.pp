class zookeeper () {

  class { 'zookeeper::config': }

  exec { 'start-zookeeper':
    command => '/usr/local/zookeeper/zookeeper-3.4.6/bin/zkServer.sh start',
    require => Class['zookeeper::config'],
  }

}
