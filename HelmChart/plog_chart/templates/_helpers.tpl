{{/*
Expand the name of the chart.
*/}}
{{- define "plog_chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "plog_chart.fullname" -}}
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
{{- define "plog_chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "plog_chart.labels" -}}
helm.sh/chart: {{ include "plog_chart.chart" . }}
{{ include "plog_chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "plog_chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "plog_chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "plog_chart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "plog_chart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
# 서비스마다 재사용될 공통 이미지 세부사항

# 서비스마다 재사용될 공통 영속성 세부사항
{{- define "common.persistence" -}}
enabled: true                               # true이면 영속성이 활성화됩니다.
size: 1Gi                                   # 영속 볼륨의 크기
{{- end }}

# 서비스마다 재사용될 공통 보안 컨텍스트 세부사항
{{- define "common.securityContext" -}}
runAsUser: 999                              # 서비스가 실행될 사용자 ID
{{- end }}

# 서비스마다 재사용될 공통 네트워크 정책 세부사항
{{- define "common.networkPolicy" -}}
enabled: true                               # true이면 네트워크 정책이 활성화됩니다.
{{- end }}
