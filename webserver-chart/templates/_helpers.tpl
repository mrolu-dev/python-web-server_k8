{{- define "webserever.name" -}}
{{ .Chart.Name }}
{{- end -}}

{{- define "webserever.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end -}}

{{- define "webserever.labels" -}}
app: {{ include "webserever.name" . }}
chart: {{ .Chart.Name }}-{{ .Chart.Version }}
release: {{ .Release.Name }}
heritage: {{ .Release.Service }}
{{- end -}}
