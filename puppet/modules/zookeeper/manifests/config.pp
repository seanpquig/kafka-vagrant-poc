class zookeeper::config () {

  exec { 'download-zookeeper':
    cwd     => '/home/vagrant',
    command => 'wget http://apache.claz.org/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz',
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
    creates => '/usr/local/zookeeper/zookeeper-3.4.6',
    require => [ Exec['download-zookeeper'], File['/usr/local/zookeeper'] ],
  }

  $zookeeper_data_dir = hiera('zookeeper_data_dir')

  file { 'zoo.cfg':
    ensure  => present,
    path    => '/usr/local/zookeeper/zookeeper-3.4.6/conf/zoo.cfg',
    content => template('zookeeper/zoo.cfg.erb'),
    require => Exec['untar-zookeeper'],
  }

  file { [ '/var/zookeeper', '/var/zookeeper/data' ]:
    ensure => 'directory',
  }

  file { '/var/zookeeper/data/myid':
    ensure   => present,
    content  => '1',
    require  => File['/var/zookeeper/data'],
  }

}
