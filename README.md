kafka-vagrant-poc
=================

Playing with Kafka, Vagrant, and Puppet.  Puppetized a lot of the work that was done in this blog post:  [link](http://www.objectpartners.com/2014/05/06/setting-up-your-own-apache-kafka-cluster-with-vagrant-step-by-step/)


##Setup

	$ vagrant init kafka-vagrant-poc http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box

Install vagrant-hosts plugin

  	$ vagrant plugin install vagrant-hosts
