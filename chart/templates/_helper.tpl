{{ define "trustification.authentication-server" -}}

{{- if (.Values.authentication).issuerUrl }}

# Authentication settings
- "--authentication-issuer-url"
- {{ .Values.authentication.issuerUrl | quote }}
{{ range .Values.authentication.clientIds -}}
- "--authentication-client-id"
- {{ . | quote }}
{{- end }}

{{- end }}

{{ end }}