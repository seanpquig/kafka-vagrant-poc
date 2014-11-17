class kafka (
  $broker_id  = 1,
) {

  class { 'kafka::config': 
    broker_id => $broker_id,
  }

  exec { 'start-kafka':
    command => '/usr/local/kafka/kafka-0.8.0-beta1-src/bin/kafka-server-start.sh /usr/local/kafka/kafka-0.8.0-beta1-src/config/server.properties &',
    path    => ['/usr/bin', '/bin'],
    unless  => 'pgrep -f kafka',
    require => Class['kafka::config'],
  }

}
