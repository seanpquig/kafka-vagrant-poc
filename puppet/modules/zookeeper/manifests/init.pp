class zookeeper () {

  class { 'zookeeper::config': }

  exec { 'start-zookeeper':
    command => '/usr/local/zookeeper/zookeeper-3.4.6/bin/zkServer.sh start',
    path    => ['/usr/bin', '/bin'],
    unless  => 'pgrep -f zookeeper',
    require => Class['zookeeper::config'],
  }

}
