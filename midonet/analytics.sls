{%- from "midonet/map.jinja" import analytics with context %}
{%- if analytics.enabled %}

midonet_analytics_packages:
  pkg.installed:
  - names: {{ analytics.pkgs }}

/etc/midonet/analytics_settings.conf:
  file.managed:
  - source: salt://midonet/files/{{ analytics.version }}/analytics_settings.conf
  - template: jinja
  - require:
    - pkg: midonet_analytics_packages
  - makedirs: true

midonet_analytics_setting:
  cmd.run:
  - name: mn-conf set -t default < /etc/midonet/analytics_settings.conf
  - require:
    - file: /etc/midonet/analytics_settings.conf

{%- endif %}