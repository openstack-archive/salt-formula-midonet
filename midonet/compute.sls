{%- from "midonet/map.jinja" import compute with context %}
{%- if compute.enabled %}

midonet_compute_packages:
  pkg.installed:
  - names: {{ compute.pkgs }}

/etc/midolman/midolman.conf:
  file.managed:
  - source: salt://midonet/files/{{ compute.version }}/midolman.conf.compute
  - template: jinja
  - require:
    - pkg: midonet_compute_packages

/etc/midolman/midolman-env.sh:
  file.managed:
  - source: salt://midonet/files/{{ compute.version }}/midolman-env.sh.compute
  - template: jinja
  - require:
    - pkg: midonet_compute_packages

midonet_configure_template:
  cmd.run:
  - name: mn-conf template-set -h local -t agent-compute-{{ compute.template }}
  - require:
    - file: /etc/midolman/midolman.conf

midonet_compute_services:
  service.running:
  - names: {{ compute.services }}
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