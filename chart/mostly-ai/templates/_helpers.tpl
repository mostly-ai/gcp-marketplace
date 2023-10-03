
{{- define "ocp.securityContextTemplate" -}}
securityContext:
  runAsNonRoot: true
  seccompProfile:
    type: RuntimeDefault
  supplementalGroups:
    - 26
    - 70
{{- end }}

{{- define "k8s.securityContextTemplate" -}}
securityContext:
  fsGroup: 1001
{{- end }}

{{- define "ocp.securityContextContainer" -}}
securityContext:
  capabilities:
    drop: ["ALL"]
  allowPrivilegeEscalation: false
{{- end }}

{{- define "mac.securityContextContainer" -}}
securityContext:
  runAsUser: 0
  runAsGroup: 0
{{- end }}

{{- define "k8s.securityContextContainer" -}}
securityContext:
 runAsUser: 1001
{{- end }}

{{- define "k8s.appNodes" -}}
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
        - matchExpressions:
            - key: mostly_app
              operator: In
              values:
                - "yes"
{{- end }}

{{- define "ocp.route.ip_whitelist" -}}
haproxy.router.openshift.io/ip_whitelist: {{ .Values.route.ip_whitelist }}
{{- end }}