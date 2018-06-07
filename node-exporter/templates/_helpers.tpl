{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "node-exporter.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "node-exporter.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "node-exporter.labels.selector" -}}
app: {{ template "node-exporter.name" . }}
group: {{ .Values.nodeExporter.labels.group }}
provider: {{ .Values.nodeExporter.labels.provider }}
{{- end -}}

{{- define "node-exporter.labels.stakater" -}}
{{ template "node-exporter.labels.selector" . }}
version: "{{ .Values.nodeExporter.labels.version }}"
{{- end -}}

{{- define "node-exporter.labels.chart" -}}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end -}}
