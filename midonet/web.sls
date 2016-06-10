{%- from "midonet/map.jinja" import web with context %}
{%- if web.enabled %}

midonet_web_packages:
  pkg.installed:
  - names: {{ web.pkgs }}

/var/www/html/midonet-manager/config/client.js:
  file.managed:
  - source: salt://midonet/files/{{ web.version }}/client.js
  - template: jinja
  - require:
    - pkg: midonet_web_packages

midonet_web_services:
  service.running:
  - names: {{ web.services }}
  - enable: true
  - watch:
    - file: /var/www/html/midonet-manager/config/client.js

{%- endif %}
