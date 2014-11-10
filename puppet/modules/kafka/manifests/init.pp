class kafka (
  $broker_id   = 1,
) {

  exec { 'download-kafka-package':
    cwd     => '/home/vagrant',
    command => '/usr/bin/wget https://archive.apache.org/dist/kafka/kafka-0.8.0-beta1-src.tgz',
    onlyif  => '/usr/bin/test ! -e /home/vagrant/kafka-0.8.0-beta1-src.tgz',
  }


}
