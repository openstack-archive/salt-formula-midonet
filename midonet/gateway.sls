{%- from "midonet/map.jinja" import gateway with context %}
{%- if gateway.enabled %}

midonet_gateway_packages:
  pkg.installed:
  - names: {{ gateway.pkgs }}

/etc/midolman/midolman.conf:
  file.managed:
  - source: salt://midonet/files/{{ gateway.version }}/midolman.conf.gateway
  - template: jinja
  - require:
    - pkg: midonet_gateway_packages

/etc/midolman/midolman-env.sh:
  file.managed:
  - source: salt://midonet/files/{{ gateway.version }}/midolman-env.sh.gateway
  - template: jinja
  - require:
    - pkg: midonet_gateway_packages

midonet_configure_template:
  cmd.run:
  - name: mn-conf template-set -h local -t agent-gateway-{{ gateway.template }}
  - require:
    - file: /etc/midolman/midolman.conf

midonet_gateway_services:
  service.running:
  - names: {{ gateway.services }}
  - enable: true
  - watch:
    - file: /etc/midolman/midolman.conf

{%- if compute.enterprise.enabled %}

midonet_enterprise_packages:
  pkg.installed:
  - names:
    - midonet-jmxscraper

{%- endif %}
{%- endif %}
