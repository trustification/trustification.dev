{{/* Arguments required to configure the HTTP server side */}}}

{{ define "trustification.http-server" -}}

- name: HTTP_SERVER_BIND_ADDR
  value: "::"

{{- end }}

