class kafka (
  $broker_id   = 1,
) {

  exec { 'download-zookeeper':
    cwd     => '/home/vagrant',
    command => 'wget http://apache.claz.org/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz,
    creates => '/home/vagrant/zookeeper-3.4.6.tar.gz',
    path    => ['/usr/bin', '/bin'],
  }

  file { '/usr/local/zookeeper':
    ensure => 'directory',
  }

  exec { 'untar-zookeeper':
    cwd     => '/home/vagrant',
    command => 'tar -zxvf zookeeper-3.4.6.tar.gz -C /usr/local/zookeeper',
    path    => ['/usr/bin', '/bin'],
    creates => '/usr/local/kafka/kafka-0.8.0-beta1-src',
    require => [ Exec['download-zookeeper'], File['/usr/local/zookeeper'] ],
  }

}
