midonet:
  control:
    version: v5.0
    enterprise:
      enabled: true
    enabled: true
    host: 127.0.0.1
    nova:
      control:
        host: 127.0.0.1
    database:
      members:
      - host: 127.0.0.1
        port: 9160
      - host: 127.0.0.1
        port: 9160
      - host: 127.0.0.1
        port: 9160
    zookeeper:
      members:
      - host: 127.0.0.1
      - host: 127.0.0.1
      - host: 127.0.0.1
    identity:
      user: midonet
      password: passwd
      host: 127.0.0.1
      admin:
        token: tokenpass
        password: passwd