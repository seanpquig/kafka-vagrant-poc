class baseconfig {

  package { 'java-1.7.0-openjdk-devel':
    ensure => installed;
  }

  file {'exports.sh':
    ensure => present,
    path   => '/etc/profile.d/exports.sh',
    source => 'puppet:///modules/baseconfig/exports.sh',
  }

}
