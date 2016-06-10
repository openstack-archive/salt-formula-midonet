
include:
{% if pillar.midonet.compute is defined %}
- midonet.compute
{% endif %}
{% if pillar.midonet.control is defined %}
- midonet.control
{% endif %}
{% if pillar.midonet.gateway is defined %}
- midonet.gateway
{% endif %}
{% if pillar.midonet.web is defined %}
- midonet.web
{% endif %}
{% if pillar.midonet.analytics is defined %}
- midonet.analytics
{% endif %}