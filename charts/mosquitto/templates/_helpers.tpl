{{/*
Expand the name of the chart.
*/}}
{{- define "mosquitto.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "mosquitto.fullname" -}}
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
{{- define "mosquitto.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "mosquitto.labels" -}}
helm.sh/chart: {{ include "mosquitto.chart" . }}
{{ include "mosquitto.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "mosquitto.selectorLabels" -}}
app.kubernetes.io/name: {{ include "mosquitto.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "mosquitto.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "mosquitto.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Certificate name
*/}}
{{- define "mosquitto.certificate.name" -}}
{{- if not (empty .Values.certificate.dnsNames) }}
{{- first .Values.certificate.dnsNames }}
{{- else }}
{{- include "mosquitto.fullname" . }}
{{- end }}
{{- end }}

{{/*
Certificate secret name
*/}}
{{- define "mosquitto.certificate.secretName" -}}
{{- if not (empty .Values.certificate.secretName) }}
{{- .Values.certificate.secretName }}
{{- else }}
{{- include "mosquitto.certificate.name" . }}
{{- end }}
{{- end }}

{{/*
Certificate issuer reference name
*/}}
{{- define "mosquitto.certificate.issuerRefName" -}}
{{- required "Mandatory field \".certificate.issuerRef.name\" is empty!" .Values.certificate.issuerRef.name -}}
{{- end }}

{{/*
IngressRoute TLS secret name
*/}}
{{- define "mosquitto.ingressRoute.tlsSecretName" -}}
{{- if not (empty .Values.ingressRoute.tlsSecretName) }}
{{- .Values.ingressRoute.tlsSecretName }}
{{- else if .Values.certificate.create }}
{{- include "mosquitto.certificate.name" . }}
{{- end }}
{{- end }}

{{/*
Site Monitor Protocol
*/}}
{{- define "sitemonitor.protocol" -}}
{{- if .Values.ingress.tls.enabled }}https
{{- else }}http
{{- end }}
{{- end }}