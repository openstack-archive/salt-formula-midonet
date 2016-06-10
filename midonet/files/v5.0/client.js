{%- from "midonet/map.jinja" import web with context %}
{
  "api_host": "http://{{ web.api.host }}:8181",
  "login_host": "http://{{ web.api.host }}:8181",
  "trace_api_host": "http://{{ web.api.host }}:8181",
  "traces_ws_url": "wss://{{ web.analytics.host }}:8460/trace",
  "api_namespace": "midonet-api",
  "api_version": "5.0",
  "api_token": false,
  "agent_config_api_namespace": "conf",
  "analytics_ws_api_url": "wss://{{ web.analytics.host }}:8080/analytics",
  "poll_enabled": true,
  "login_animation_enabled": true
}