

# zwavejs

A Helm chart for Kubernetes

![Version: 0.7.1](https://img.shields.io/badge/Version-0.7.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 8](https://img.shields.io/badge/AppVersion-8-informational?style=flat-square)

## Requirements

- [`helm`](https://helm.sh) - Refer to their [docs](https://helm.sh/docs) to get started.

## Usage

To use this chart add the repo as follows:

```console
$ helm repo add aaronseibert https://helm.seibert.family
```

If you had already added this repo earlier, run `helm repo update` to retrieve the latest versions of the packages.

To install this chart simply run the following command:

```console
$ helm install zwavejs aaronseibert/zwavejs
```

To uninstall this chart simply run the following command:

```console
$ helm delete zwavejs
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Pod-level affinity. More info [here](https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#scheduling). |
| certificate.annotations | object | `{}` | Additional annotations for the certificate object. |
| certificate.create | bool | `false` | Create an Certificate object for the exposed chart. |
| certificate.duration | string | `"2160h0m0s"` | Certificate Duration |
| certificate.issuerRef.kind | string | `"ClusterIssuer"` | Type of the referenced certificate issuer. Can be "Issuer" or "ClusterIssuer". |
| certificate.issuerRef.name | string | `""` | Name of the referenced certificate issuer. |
| certificate.labels | object | `{}` | Additional labels for the certificate object. |
| certificate.renewBefore | string | `"360h0m0s"` | Renewal Threshold |
| controller.annotations | object | `{}` | Additional annotations for the controller object. |
| controller.enabled | bool | `true` | Create a workload for this chart. |
| controller.kind | string | `"Deployment"` | Type of the workload object. |
| controller.labels | object | `{}` | Additional labels for the controller object. |
| controller.replicas | int | `1` | The number of replicas. |
| env.timezone | string | `"UTC"` | Timezone for the container. |
| fullnameOverride | string | `""` |  |
| global.fqdn | string | `"domain.example.com"` | Sets the fqdn to be used through various templates |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"zwavejs/zwave-js-ui"` |  |
| image.tag | string | `""` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` | Create an Ingress object for exposing this chart |
| ingress.hosts[0].host | string | `""` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| ingressRoute.annotations | object | `{}` | Additional annotations for the ingress route object. |
| ingressRoute.create | bool | `false` | Create an IngressRoute object for exposing this chart. |
| ingressRoute.entryPoints | list | `[]` | List of [entry points](https://doc.traefik.io/traefik/routing/routers/#entrypoints) on which the ingress route will be available. |
| ingressRoute.labels | object | `{}` | Additional labels for the ingress route object. |
| ingressRoute.middlewares | list | `[{"name":"stripprefix-websocket"}]` | List of [middleware objects](https://doc.traefik.io/traefik/routing/providers/kubernetes-crd/#kind-middleware) for the ingress route. |
| ingressRoute.tlsSecretName | string | `""` | Use an existing secret containing the TLS certificate. |
| istio.enable | bool | `false` | Enable istio |
| istio.gateway | object | `{"create":true,"selector":{"istio":"ingressgateway"},"servers":[{"name":"http","number":80,"protocol":"http","tls":{"httpsRedirect":true}},{"name":"https","number":443,"protocol":"https","tls":{"credentialName":"zwavejs-cert","mode":"SIMPLE"}}]}` | Gateway configuration |
| istio.gateway.create | bool | `true` | Enable the Gateway |
| istio.gateway.selector | object | `{"istio":"ingressgateway"}` | Define the Gateway selector |
| istio.gateway.servers | list | `[{"name":"http","number":80,"protocol":"http","tls":{"httpsRedirect":true}},{"name":"https","number":443,"protocol":"https","tls":{"credentialName":"zwavejs-cert","mode":"SIMPLE"}}]` | Servers Config |
| istio.virtualservice.create | bool | `true` |  |
| nameOverride | string | `""` |  |
| persistentVolumeClaim.accessMode | string | `"ReadWriteOnce"` | Access mode of the persistent volume claim object. |
| persistentVolumeClaim.annotations | object | `{}` | Additional annotations for the persistent volume claim object. |
| persistentVolumeClaim.create | bool | `false` | Create a new persistent volume claim object. |
| persistentVolumeClaim.existingPersistentVolumeClaim | string | `""` | Use an existing persistent volume claim object. |
| persistentVolumeClaim.labels | object | `{}` | Additional labels for the persistent volume claim object. |
| persistentVolumeClaim.mountPath | string | `"/usr/src/app/store"` | Mount path of the persistent volume claim object. |
| persistentVolumeClaim.size | string | `"5Gi"` | Storage request size for the persistent volume claim object. |
| persistentVolumeClaim.storageClassName | string | `"ceph-rbd"` | Storage class name for the persistent volume claim object. |
| persistentVolumeClaim.volumeMode | string | `"Filesystem"` | Volume mode of the persistent volume claim object. |
| podAnnotations | object | `{}` |  |
| ports.http.enabled | bool | `true` | Enable the port inside the `Deployment` and `Service` objects. |
| ports.http.nodePort | string | `nil` | The external port used if `.service.type` == `NodePort`. |
| ports.http.port | int | `8091` | The port used as internal port and cluster-wide port if `.service.type` == `ClusterIP`. |
| ports.http.protocol | string | `"TCP"` | The protocol used for the service. |
| ports.websocket.enabled | bool | `true` | Enable the port inside the `Deployment` and `Service` objects. |
| ports.websocket.nodePort | string | `nil` | The external port used if `.service.type` == `NodePort`. |
| ports.websocket.port | int | `3000` | The port used as internal port and cluster-wide port if `.service.type` == `ClusterIP`. |
| ports.websocket.protocol | string | `"TCP"` | The protocol used for the service. |
| rbac.annotations | object | `{}` | Additional annotations for the role and role binding objects. |
| rbac.create | bool | `false` | Create `Role` and `RoleBinding` objects. |
| rbac.labels | object | `{}` | Additional labels for the role and role binding objects. |
| resources | object | `{}` | Compute resources used by the container. More info [here](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/). |
| secret.annotations | object | `{}` | Additional annotations for the secret object. |
| secret.create | bool | `false` | Create a new secret |
| secret.existingSecret | string | `""` | Use an existing secre |
| secret.labels | object | `{}` | Additional labels for the secret object. |
| secret.secretKey | string | `""` | Secret Key used when not using an existing secret. |
| securityContext | object | `{}` | Pod-level security attributes. More info [here](https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#security-context). |
| service.annotations | object | `{}` | Additional annotations for the service object. |
| service.enabled | bool | `true` | Create a service for exposing this chart. |
| service.labels | object | `{}` | Additional labels for the service object. |
| service.type | string | `"ClusterIP"` | The service type used. |
| serviceAccount.create | bool | `false` | Specify the service account used for the controller. |
| serviceAccount.name | string | `""` |  |
| tolerations | object | `{}` | Pod-level tolerations. More info [here](https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#scheduling). |

## License

[MIT](../LICENSE.md) – © 2023 [Aaron Seibert](https://helm.seibert.family)
