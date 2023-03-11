

# paperless-ngx

Paperless-NGX Application - webserver component

![Version: 0.1.8](https://img.shields.io/badge/Version-0.1.8-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.9.2](https://img.shields.io/badge/AppVersion-1.9.2-informational?style=flat-square)

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
| global.database | object | `{"postgres":{"enabled":false,"host":"","name":"paperless","password":"paperless","port":"","user":"paperless"}}` | database connection properties |
| global.database.postgres.enabled | bool | `false` | enable/disable postgres support |
| global.database.postgres.host | string | `""` | db host |
| global.database.postgres.port | string | `""` | db port |
| global.database.postgres.user | string | `"paperless"` | db user |
| global.database.postgres.password | string | `"paperless"` | db password |
| global.database.postgres.name | string | `"paperless"` | db name |
| global.broker | object | `{"redis":{"enabled":false,"host":"","port":""}}` | broker connection properties |
| global.broker.redis.enabled | bool | `false` | enable/disable redis support |
| global.broker.redis.host | string | `""` | redis host |
| global.broker.redis.port | string | `""` | redis port |
| controller.enabled | bool | `true` | Create a workload for this chart. |
| controller.kind | string | `"Deployment"` | Type of the workload object. |
| controller.replicas | int | `1` | The number of replicas. |
| controller.annotations | object | `{}` | Additional annotations for the controller object. |
| controller.labels | object | `{}` | Additional labels for the controller object. |
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
| persistentVolumeClaim.create | bool | `false` | Create a new persistent volume claim object. |
| persistentVolumeClaim.mountPath | string | `"/usr/src/paperless"` | Mount path of the persistent volume claim object. |
| persistentVolumeClaim.accessMode | string | `"ReadWriteOnce"` | Access mode of the persistent volume claim object. |
| persistentVolumeClaim.volumeMode | string | `"Filesystem"` | Volume mode of the persistent volume claim object. |
| persistentVolumeClaim.size | string | `"1Gi"` | Storage request size for the persistent volume claim object. |
| persistentVolumeClaim.storageClassName | string | `""` | Storage class name for the persistent volume claim object. |
| persistentVolumeClaim.existingPersistentVolumeClaim | string | `""` | Use an existing persistent volume claim object. |
| persistentVolumeClaim.annotations | object | `{}` | Additional annotations for the persistent volume claim object. |
| persistentVolumeClaim.labels | object | `{}` | Additional labels for the persistent volume claim object. |
| consumption.enabled | bool | `false` | Enable the volume mount of a [consumption directory](https://paperless-ngx.readthedocs.io/en/latest/configuration.html#paths-and-folders). |
| consumption.mountPath | string | `"/usr/src/paperless/consume"` | Mount path of the consumption directory inside the container. |
| consumption.hostPath | string | `""` | Host path of the consumption directory outside the container. |
| consumption.nfs.enabled | bool | `false` | Enable NFS for the consumption directory |
| consumption.nfs.server | string | `""` | The NFS server to use |
| consumption.nfs.path | string | `""` | The path to the directory |
| consumption.nfs.readOnly | bool | `false` | Mount the directory read-only. This must be false |
| export.enabled | bool | `false` | Enable the volume mount of an export directory for [backups](https://paperless-ngx.readthedocs.io/en/latest/administration.html#making-backups) using the [document exporter](https://paperless-ngx.readthedocs.io/en/latest/administration.html#utilities-exporter). |
| export.mountPath | string | `"/usr/src/paperless/export"` | Mount path of the export directory inside the container. |
| export.hostPath | string | `""` | Host path of the export directory outside the container. |
| export.nfs.enabled | bool | `false` | Enable NFS for the export directory |
| export.nfs.server | string | `""` | The NFS server to use |
| export.nfs.path | string | `""` | The path to the directory |
| export.nfs.readOnly | bool | `false` | Mount the directory read-only. This must be false |
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
| trash.nfs.enabled | bool | `false` | Enable NFS for the trash directory |
| trash.nfs.server | string | `""` | The NFS server to use |
| trash.nfs.path | string | `""` | The path to the directory |
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
