{{/*
Expand the name of the chart.
*/}}
{{- define "paperless-ngx.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "paperless-ngx.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "paperless-ngx.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels*/}}
{{- define "paperless-ngx.labels" -}}
helm.sh/chart: {{ include "paperless-ngx.chart" . }}
{{ include "paperless-ngx.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "paperless-ngx.selectorLabels" -}}
app.kubernetes.io/name: {{ include "paperless-ngx.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "paperless-ngx.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "paperless-ngx.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Consumption host path
*/}}
{{- define "paperless-ngx.consumption.hostPath" -}}
{{- if .Values.consumption.enabled }}
{{- .Values.consumption.hostPath }}
{{- end }}
{{- end }}

{{/*
Consumption mount path
*/}}
{{- define "paperless-ngx.consumption.mountPath" -}}
{{- if .Values.consumption.enabled }}
{{- default "/consumption" .Values.consumption.mountPath }}
{{- end }}
{{- end }}

{{/*
Consumption enabled
*/}}
{{- define "paperless-ngx.consumption.enabled" -}}
{{- if .Values.consumption.enabled }}
{{- if and (include "paperless-ngx.consumption.hostPath" .) (include "paperless.consumption.mountPath" .) }}
{{- printf "true" }}
{{- else }}
{{- printf "false" }}
{{- end }}
{{- else }}
{{- printf "false" }}
{{- end }}
{{- end }}

{{/*
Export host path
*/}}
{{- define "paperless-ngx.export.hostPath" -}}
{{- if .Values.export.enabled }}
{{- .Values.export.hostPath }}
{{- end }}
{{- end }}

{{/*
Export mount path
*/}}
{{- define "paperless-ngx.export.mountPath" -}}
{{- if .Values.export.enabled }}
{{- default "/export" .Values.export.mountPath }}
{{- end }}
{{- end }}

{{/*
Export enabled
*/}}
{{- define "paperless-ngx.export.enabled" -}}
{{- if .Values.export.enabled }}
{{- if and (include "paperless-ngx.export.hostPath" .) (include "paperless.export.mountPath" .) }}
{{- printf "true" }}
{{- else }}
{{- printf "false" }}
{{- end }}
{{- else }}
{{- printf "false" }}
{{- end }}
{{- end }}

{{/*
Export command
*/}}
{{- define "paperless-ngx.export.command" -}}
{{ printf "kubectl exec -it -n %s deploy/%s -- document_exporter %s" .Release.Namespace (include "paperless-ngx.fullname" . ) (include "paperless.export.mountPath" . ) }}
{{- end }}

{{/*
Trash host path
*/}}
{{- define "paperless-ngx.trash.hostPath" -}}
{{- if .Values.trash.enabled }}
{{- .Values.trash.hostPath }}
{{- end }}
{{- end }}

{{/*
Trash mount path
*/}}
{{- define "paperless-ngx.trash.mountPath" -}}
{{- if .Values.trash.enabled }}
{{- default "/export" .Values.trash.mountPath }}
{{- end }}
{{- end }}

{{/*
Trash enabled
*/}}
{{- define "paperless-ngx.trash.enabled" -}}
{{- if .Values.trash.enabled }}
{{- if and (include "paperless-ngx.trash.hostPath" .) (include "paperless.trash.mountPath" .) }}
{{- printf "true" }}
{{- else }}
{{- printf "false" }}
{{- end }}
{{- else }}{{- printf "false" }}
{{- end }}
{{- end }}

{{/*
Certificate name
*/}}
{{- define "paperless-ngx.certificate.name" -}}
{{- if not (empty .Values.certificate.dnsNames) }}
{{- first .Values.certificate.dnsNames }}
{{- else }}
{{- include "paperless-ngx.fullname" . }}
{{- end }}
{{- end }}

{{/*
Certificate secret name
*/}}
{{- define "paperless-ngx.certificate.secretName" -}}
{{- if not (empty .Values.certificate.secretName) }}
{{- .Values.certificate.secretName }}
{{- else }}
{{- include "paperless-ngx.certificate.name" . }}
{{- end }}
{{- end }}

{{/*
Certificate issuer reference name
*/}}
{{- define "paperless-ngx.certificate.issuerRefName" -}}
{{- required "Mandatory field \".certificate.issuerRef.name\" is empty!" .Values.certificate.issuerRef.name -}}
{{- end }}

{{/*
IngressRoute TLS secret name
*/}}
{{- define "paperless-ngx.ingressRoute.tlsSecretName" -}}
{{- if not (empty .Values.ingressRoute.tlsSecretName) }}
{{- .Values.ingressRoute.tlsSecretName }}
{{- else if .Values.certificate.create }}
{{- include "paperless-ngx.certficate.name" . }}
{{- end }}
{{- end }}
