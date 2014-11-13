include baseconfig

node 'node1' {
  class{ 'kafka':
    broker_id => 1,
  }
  class{ 'zookeeper': }
}

