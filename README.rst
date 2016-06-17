=======
Midonet
=======

MidoNet is an advanced Software Defined Networking (SDN) solution, which provides network virtualization for public and private cloud environments.

Sample pillars
==============

Cluster Control
----------------

.. code-block:: yaml

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

Analytics
-----------

.. code-block:: yaml

    midonet:
      analytics:
        version: v5.0
        enterprise:
          enabled: true
        enabled: true
        host: 127.0.0.1

Gateway
--------

.. code-block:: yaml

	midonet:
      gateway:
	    version: v5.0
	    enterprise:
	      enabled: true
	    enabled: true
	    zookeeper:
	      members:
	      - host: 127.0.0.1
	      - host: 127.0.0.1
	      - host: 127.0.0.1
	    template: medium

Compute
--------

.. code-block:: yaml

	midonet:
      compute:
	    version: v5.0
	    enterprise:
	      enabled: true
	    enabled: true
	    zookeeper:
	      members:
	      - host: 127.0.0.1
	      - host: 127.0.0.1
	      - host: 127.0.0.1
	    template: medium

Web
----

.. code-block:: yaml

	midonet:
	  web:
	    version: v5.0
	    enabled: true
	    api:
	      host: 127.0.0.1
	    analytics:
	      host: 127.0.0.1

Read More
=========

* http://www.midokura.com/midonet/