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
  value: {{ .clientId | quote }}
- name: OIDC_PROVIDER_CLIENT_SECRET
  valueFrom:
    {{- $client | toYaml | nindent 4 }}
- name: OIDC_PROVIDER_ISSUER_URL
  value: {{ .root.Values.authentication.issuerUrl | quote }}

{{- end }}{{/* if issuerUrl */}}

{{- end }}