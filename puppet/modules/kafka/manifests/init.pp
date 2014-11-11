class kafka (
  $broker_id   = 1,
) {

  exec { 'download-kafka-package':
    cwd     => '/home/vagrant',
    command => 'wget https://archive.apache.org/dist/kafka/kafka-0.8.0-beta1-src.tgz',
    creates => '/home/vagrant/kafka-0.8.0-beta1-src.tgz',
    path    => ['/usr/bin', '/bin'],
  }

  file { '/usr/local/kafka':
    ensure => 'directory',
  }

  exec { 'untar-kafka':
    cwd     => '/home/vagrant',
    command => 'tar -zxvf kafka-0.8.0-beta1-src.tgz -C /usr/local/kafka',
    path    => ['/usr/bin', '/bin'],
    creates => '/usr/local/kafka/kafka-0.8.0-beta1-src',
    require => [ Exec['download-kafka-package'], File['/usr/local/kafka'] ],
  }

  exec { 'sbt-build':
    cwd      => '/usr/local/kafka/kafka-0.8.0-beta1-src',
    command  => './sbt update && ./sbt package && ./sbt assembly-package-dependency',
    provider => shell,
    timeout  => 600,
    path     => ['/usr/local/kafka/kafka-0.8.0-beta1-src', '/usr/bin'],
    creates  => '/usr/local/kafka/kafka-0.8.0-beta1-src/target',
    require  => Exec['untar-kafka'],
  }

}
