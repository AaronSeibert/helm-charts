

# paperless-ngx

A Helm chart for Kubernetes

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.9.2](https://img.shields.io/badge/AppVersion-1.9.2-informational?style=flat-square)

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
$ helm install paperless-ngx aaronseibert/paperless-ngx
```

To uninstall this chart simply run the following command:

```console
$ helm delete paperless-ngx
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.repository | string | `"ghcr.io/paperless-ngx/paperless-ngx"` | The repository to pull the image from. |
| image.tag | string | `.Chart.AppVersion` | The docker tag, if left empty chart's appVersion will be used. |
| image.pullPolicy | string | `"IfNotPresent"` | The pull policy for the controller. |
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| service.enabled | bool | `true` | Create a service for exposing this chart. |
| service.type | string | `"ClusterIP"` | The service type used. |
| service.annotations | object | `{}` | Additional annotations for the service object. |
| service.labels | object | `{}` | Additional labels for the service object. |
| ingressRoute.create | bool | `false` | Create an IngressRoute object for exposing this chart. |
| ingressRoute.entryPoints | list | `[]` | List of [entry points](https://doc.traefik.io/traefik/routing/routers/#entrypoints) on which the ingress route will be available. |
| ingressRoute.rule | string | `""` | [Matching rule](https://doc.traefik.io/traefik/routing/routers/#rule) for the underlying router. |
| ingressRoute.middlewares | list | `[]` | List of [middleware objects](https://doc.traefik.io/traefik/routing/providers/kubernetes-crd/#kind-middleware) for the ingress route. |
| ingressRoute.tlsSecretName | string | `""` | Use an existing secret containing the TLS certificate. |
| ingressRoute.annotations | object | `{}` | Additional annotations for the ingress route object. |
| ingressRoute.labels | object | `{}` | Additional labels for the ingress route object. |
| certificate.create | bool | `false` | Create an Certificate object for the exposed chart. |
| certificate.dnsNames | list | `[]` | List of subject alternative names for the certificate. |
| certificate.secretName | string | `""` | Name of the secret in which the certificate will be stored. Defaults to the first item in dnsNames. |
| certificate.issuerRef.kind | string | `"ClusterIssuer"` | Type of the referenced certificate issuer. Can be "Issuer" or "ClusterIssuer". |
| certificate.issuerRef.name | string | `""` | Name of the referenced certificate issuer. |
| certificate.annotations | object | `{}` | Additional annotations for the certificate object. |
| certificate.labels | object | `{}` | Additional labels for the certificate object. |
| env[0] | object | `{"name":"TZ","value":"UTC"}` | Timezone for the container. |
| ports.http.enabled | bool | `true` | Enable the port inside the `Deployment` and `Service` objects. |
| ports.http.port | int | `8000` | The port used as internal port and cluster-wide port if `.service.type` == `ClusterIP`. |
| ports.http.nodePort | string | `nil` | The external port used if `.service.type` == `NodePort`. |
| ports.http.protocol | string | `"TCP"` | The protocol used for the service. |
| secret.create | bool | `true` | Create a new secret containing the [secret key](https://paperless-ngx.readthedocs.io/en/latest/configuration.html#hosting-security). |
| secret.existingSecret | string | `""` | Use an existing secret to store the [secret key](https://paperless-ngx.readthedocs.io/en/latest/configuration.html#hosting-security). |
| secret.secretKey | string | `""` | [Secret key](https://paperless-ngx.readthedocs.io/en/latest/configuration.html#hosting-security) used when not using an existing secret. |
| secret.annotations | object | `{}` | Additional annotations for the secret object. |
| secret.labels | object | `{}` | Additional labels for the secret object. |
| persistentVolumeClaim.create | bool | `true` | Create a new persistent volume claim object. |
| persistentVolumeClaim.mountPath | string | `"/usr/src/paperless"` | Mount path of the persistent volume claim object. |
| persistentVolumeClaim.accessMode | string | `"ReadWriteOnce"` | Access mode of the persistent volume claim object. |
| persistentVolumeClaim.volumeMode | string | `"Filesystem"` | Volume mode of the persistent volume claim object. |
| persistentVolumeClaim.size | string | `"1Gi"` | Storage request size for the persistent volume claim object. |
| persistentVolumeClaim.storageClassName | string | `""` | Storage class name for the persistent volume claim object. |
| persistentVolumeClaim.existingPersistentVolumeClaim | string | `""` | Use an existing persistent volume claim object. |
| persistentVolumeClaim.annotations | object | `{}` | Additional annotations for the persistent volume claim object. |
| persistentVolumeClaim.labels | object | `{}` | Additional labels for the persistent volume claim object. |
| consumption.enabled | bool | `true` | Enable the volume mount of a [consumption directory](https://paperless-ngx.readthedocs.io/en/latest/configuration.html#paths-and-folders). |
| consumption.mountPath | string | `"/consumption"` | Mount path of the consumption directory inside the container. |
| consumption.hostPath | string | `""` | Host path of the consumption directory outside the container. |
| export.enabled | bool | `true` | Enable the volume mount of an export directory for [backups](https://paperless-ngx.readthedocs.io/en/latest/administration.html#making-backups) using the [document exporter](https://paperless-ngx.readthedocs.io/en/latest/administration.html#utilities-exporter). |
| export.mountPath | string | `"/export"` | Mount path of the export directory inside the container. |
| export.hostPath | string | `""` | Host path of the export directory outside the container. |
| export.cronJob.enabled | bool | `false` | Create a `CronJob` object for [automated exports](https://paperless-ngx.readthedocs.io/en/latest/administration.html#making-backups). |
| export.cronJob.schedule | string | `"0 4 * * 1"` | Schedule for automated exports. |
| export.cronJob.suspend | bool | `false` | Enable/disable the cron job schedule quickly. |
| export.cronJob.successfulJobsHistoryLimit | int | `3` | The number of successful finished jobs to retain. |
| export.cronJob.failedJobsHistoryLimit | int | `1` | The number of failed finished jobs to retain. |
| export.cronJob.annotations | object | `{}` | Additional annotations for the cronjob object. |
| export.cronJob.labels | object | `{}` | Additional labels for the cronjob object. |
| trash.enabled | bool | `false` | Enable the volume mount of a [trash directory](https://paperless-ngx.readthedocs.io/en/latest/configuration.html#paths-and-folders). |
| trash.mountPath | string | `"/trash"` | Mount path of the trash directory inside the container. |
| trash.hostPath | string | `""` | Host path of the trash directory outside the container. |
| serviceAccount.name | string | `""` | Specify the service account used for the controller. |
| rbac.create | bool | `true` | Create `Role` and `RoleBinding` objects. |
| rbac.annotations | object | `{}` | Additional annotations for the role and role binding objects. |
| rbac.labels | object | `{}` | Additional labels for the role and role binding objects. |
| securityContext | object | `{}` | Pod-level security attributes. More info [here](https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#security-context). |
| resources | object | `{}` | Compute resources used by the container. More info [here](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/). |
| affinity | object | `{}` | Pod-level affinity. More info [here](https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#scheduling). |
| tolerations | object | `{}` | Pod-level tolerations. More info [here](https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#scheduling). |

## License

[MIT](../LICENSE.md) – © 2023 [Aaron Seibert](https://helm.seibert.family)