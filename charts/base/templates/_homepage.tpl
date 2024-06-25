{{- define base.homepage.tpl -}}
gethomepage.dev/description: {{ .Chart.Description }}
gethomepage.dev/enabled: "true"
gethomepage.dev/group: ""
gethomepage.dev/icon: {{ printf "si-%s" .Chart.Name }}
gethomepage.dev/name: {{ .Chart.Name }}
gethomepage.dev/siteMonitor: {{ .Values.global.fqdn }}
{{- end -}}
{{- define "base.homepage" -}}
{{- include "base.util.merge" (append . "base.homepage.tpl") -}}
{{- end -}}
