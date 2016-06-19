{%- from "midonet/map.jinja" import control with context %}
{%- if control.enabled %}

midonet_control_packages:
  pkg.installed:
  - names: {{ control.pkgs }}

/etc/midonet/midonet.conf:
  file.managed:
  - source: salt://midonet/files/{{ control.version }}/midonet.conf
  - template: jinja
  - require:
    - pkg: midonet_control_packages

/etc/midonet/default.json:
  file.managed:
  - source: salt://midonet/files/{{ control.version }}/default.json
  - template: jinja
  - require:
    - pkg: midonet_control_packages

/root/.midonetrc:
  file.managed:
  - source: salt://midonet/files/{{ control.version }}/midonetrc
  - template: jinja
  - require:
    - pkg: midonet_control_packages

midonet_control_services:
  service.running:
  - names: {{ control.services }}
  - enable: true
  - watch:
    - file: /etc/midonet/midonet.conf

{%- if grains.get('virtual_subtype', None) == "Docker" %}

midonet_control_entrypoint:
  file.managed:
  - name: /entrypoint.sh
  - template: jinja
  - source: salt://midonet/files/entrypoint.sh.control
  - mode: 755

{%- else %}

midonet_initial_setting:
  cmd.run:
  - name: cat /etc/midonet/default.json | mn-conf set -t default
  - require:
    - file: /etc/midonet/default.json

{%- endif %}

{%- if control.enterprise.enabled %}

midonet_enterprise_packages:
  pkg.installed:
  - names:
    - midonet-cluster-mem

{%- endif %}
{%- endif %}