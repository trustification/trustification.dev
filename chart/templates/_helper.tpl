{{/* Arguments required to configure the server side authentication */}}}
{{ define "trustification.authentication-server" -}}

{{- if (.Values.authentication).issuerUrl }}

# Authentication settings
- "--authentication-issuer-url"
- {{ .Values.authentication.issuerUrl | quote }}
{{ range .Values.authentication.clientIds -}}
- "--authentication-client-id"
- {{ . | quote }}
{{ end }}

{{- end }}

{{ end }}

{{/* Arguments required to configure the client side authentication settings */}}}

{{ define "trustification.authentication-client" -}}

{{- if (.root.Values.authentication).issuerUrl }}

{{- $client := get .root.Values.oidcClients .clientId -}}

# OIDC client settings

- name: OIDC_PROVIDER_CLIENT_ID
  {{- if $client.clientId }}
  {{- $client.clientId | toYaml | nindent 2 }}
  {{- else }}
  value: {{ .clientId | quote }}
  {{- end }}
- name: OIDC_PROVIDER_CLIENT_SECRET
  {{- $client.clientSecret | toYaml | nindent 2 }}
- name: OIDC_PROVIDER_ISSUER_URL
  value: {{ .root.Values.authentication.issuerUrl | quote }}

{{- end }}{{/* if issuerUrl */}}

{{- end }}

{{/* The client ID of the frontend client */}}
{{- define "trustification.authentication-frontend-client-id" -}}
{{ if .Values.oidcClients.frontend.clientId  }}
{{ .Values.oidcClients.frontend.clientId | toYaml }}
{{ else }}
value: frontend
{{ end }}
{{-end }}