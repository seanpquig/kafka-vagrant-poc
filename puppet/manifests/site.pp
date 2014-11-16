include baseconfig

node 'node1.shuttercorp.net' {
  class{ 'kafka':
    broker_id => 1,
  }
  class{ 'zookeeper': }
}

node 'node2.shuttercorp.net' {
  class{ 'kafka':
    broker_id => 2,
  }
}

