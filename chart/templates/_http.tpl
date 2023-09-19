{{/* Environment variables required to configure the HTTP server side */}}}
{{ define "trustification.http-server" -}}

- name: HTTP_SERVER_BIND_ADDR
  value: "::"

{{- end }}

{{/* Volume mounts matching the HTTP server side configuration */}}}
{{ define "trustification.http-server-volume-mounts" -}}

- mountPath: /etc/tls
  name: tls

{{- end }}

{{/* Volumes matching the HTTP server side configuration */}}}
{{ define "trustification.http-server-volumes" -}}
- name: tls
  secret:
    name: {{ .appName }}-tls
{{- end }}
