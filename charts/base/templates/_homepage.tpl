{{- define base.homepage.tpl -}}
gethomepage.dev/description: {{ .Chart.Description }}
gethomepage.dev/enabled: "true"
gethomepage.dev/group: ""
gethomepage.dev/icon: {{ printf "%s.png" .Chart.Name }}
gethomepage.dev/name: {{ .Chart.Name }}
gethomepage.dev/siteMonitor: {{ printf "https://%s.seibert.family" .Chart.Name }}
{{- end -}}
{{- define "base.homepage" -}}
{{- include "base.util.merge" (append . "base.homepage.tpl") -}}
{{- end -}}
