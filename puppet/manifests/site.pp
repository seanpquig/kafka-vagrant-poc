include baseconfig

node 'node1' {
  class{ 'kafka': }
  class{ 'zookeeper': }
}

