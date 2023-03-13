

# paperless

An umbrella chart for Paperless-NGX.

![Version: 0.1.28](https://img.shields.io/badge/Version-0.1.28-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.9.2](https://img.shields.io/badge/AppVersion-1.9.2-informational?style=flat-square)

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
$ helm install paperless aaronseibert/paperless
```

To uninstall this chart simply run the following command:

```console
$ helm delete paperless
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.broker | object | `{"redis":{"enabled":false,"host":"","port":""}}` | broker connection properties |
| global.broker.redis.enabled | bool | `false` | enable/disable redis support |
| global.broker.redis.host | string | `""` | redis host |
| global.broker.redis.port | string | `""` | redis port |
| global.database | object | `{"postgres":{"enabled":false,"host":"","name":"paperless","password":"paperless","port":"","user":"paperless"}}` | database connection properties |
| global.database.postgres | object | See [values.yaml](https://github.com/AaronSeibert/helm-charts/tree/main/charts/postgres/values.yaml) | Enable and configure [postgres subchart](https://github.com/AaronSeibert/helm-charts/tree/main/charts/postgres) under this key. |
| global.database.postgres.enabled | bool | `false` | enable/disable postgres support |
| global.database.postgres.host | string | `""` | db host |
| global.database.postgres.name | string | `"paperless"` | db name |
| global.database.postgres.password | string | `"paperless"` | db password |
| global.database.postgres.port | string | `""` | db port |
| global.database.postgres.user | string | `"paperless"` | db user |
| broker.redis | string | See [values.yaml](https://github.com/AaronSeibert/helm-charts/tree/main/charts/redis/values.yaml) | Configure [redis subchart](https://github.com/AaronSeibert/helm-charts/tree/main/charts/redis) under this key. |
| database.postgres | string | See [values.yaml](https://github.com/AaronSeibert/helm-charts/tree/main/charts/postgres/values.yaml) | Configure [postgres subchart](https://github.com/AaronSeibert/helm-charts/tree/main/charts/postgres) under this key. |
| webserver | object | See [values.yaml](https://github.com/AaronSeibert/helm-charts/tree/main/charts/paperless-ngx/values.yaml) | Enable and configure [paperless-ngx subchart](https://github.com/AaronSeibert/helm-charts/tree/main/charts/paperless-ngx) under this key. |
| broker.fullnameOverride | string | `""` |  |
| broker.image.pullPolicy | string | `"IfNotPresent"` |  |
| broker.image.repository | string | `"redis"` |  |
| broker.image.tag | string | `""` |  |
| broker.imagePullSecrets | list | `[]` |  |
| broker.nameOverride | string | `""` |  |
| broker.persistence.enabled | bool | `false` |  |
| broker.podAnnotations | object | `{}` |  |
| broker.replicaCount | int | `1` |  |
| broker.resources | object | `{}` |  |
| broker.service.name | string | `"redis"` |  |
| broker.service.port | int | `6379` |  |
| broker.service.protocol | string | `"TCP"` |  |
| broker.service.targetPort | string | `"redis"` |  |
| broker.service.type | string | `"ClusterIP"` |  |
| database.configMap.postgresDb | string | `"postgresdb"` |  |
| database.configMap.postgresPassword | string | `"psltest"` |  |
| database.configMap.postgresUser | string | `"admin"` |  |
| database.fullnameOverride | string | `""` |  |
| database.image.pullPolicy | string | `"IfNotPresent"` |  |
| database.image.repository | string | `"postgres"` |  |
| database.image.tag | string | `""` |  |
| database.nameOverride | string | `""` |  |
| database.persistence.accessMode | string | `"ReadWriteOnce"` |  |
| database.persistence.enabled | bool | `false` |  |
| database.persistence.existingClaim | string | `""` |  |
| database.persistence.size | string | `"1Gi"` |  |
| database.persistence.storageClass | string | `""` |  |
| database.podAnnotations | object | `{}` |  |
| database.replicaCount | int | `1` |  |
| database.resources | object | `{}` |  |
| database.service.port | int | `5432` |  |
| database.service.targetPort | string | `"postgresql"` |  |
| database.service.type | string | `"ClusterIP"` |  |
| webserver.affinity | object | `{}` | Pod-level affinity. More info [here](https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#scheduling). |
| webserver.certificate.annotations | object | `{}` | Additional annotations for the certificate object. |
| webserver.certificate.create | bool | `false` | Create an Certificate object for the exposed chart. |
| webserver.certificate.dnsNames | list | `[]` | List of subject alternative names for the certificate. |
| webserver.certificate.issuerRef.kind | string | `"ClusterIssuer"` | Type of the referenced certificate issuer. Can be "Issuer" or "ClusterIssuer". |
| webserver.certificate.issuerRef.name | string | `""` | Name of the referenced certificate issuer. |
| webserver.certificate.labels | object | `{}` | Additional labels for the certificate object. |
| webserver.certificate.secretName | string | `""` | Name of the secret in which the certificate will be stored. Defaults to the first item in dnsNames. |
| webserver.consumption.enabled | bool | `false` | Enable the volume mount of a [consumption directory](https://paperless-ngx.readthedocs.io/en/latest/configuration.html#paths-and-folders). |
| webserver.consumption.hostPath | string | `""` | Host path of the consumption directory outside the container. |
| webserver.consumption.mountPath | string | `"/usr/src/paperless/consume"` | Mount path of the consumption directory inside the container. |
| webserver.consumption.nfs.enabled | bool | `false` | Enable NFS for the consumption directory |
| webserver.consumption.nfs.path | string | `""` | The path to the directory |
| webserver.consumption.nfs.readOnly | bool | `false` | Mount the directory read-only. This must be false |
| webserver.consumption.nfs.server | string | `""` | The NFS server to use |
| webserver.controller.annotations | object | `{}` | Additional annotations for the controller object. |
| webserver.controller.enabled | bool | `true` | Create a workload for this chart. |
| webserver.controller.kind | string | `"Deployment"` | Type of the workload object. |
| webserver.controller.labels | object | `{}` | Additional labels for the controller object. |
| webserver.controller.replicas | int | `1` | The number of replicas. |
| webserver.env.fqdn | string | `"paperless.domain.com"` | The FQDN for the service. Used for PAPERLESS_URL |
| webserver.env.timezone | string | `"UTC"` | Timezone for the container. |
| webserver.export.cronJob.annotations | object | `{}` | Additional annotations for the cronjob object. |
| webserver.export.cronJob.enabled | bool | `false` | Create a `CronJob` object for [automated exports](https://paperless-ngx.readthedocs.io/en/latest/administration.html#making-backups). |
| webserver.export.cronJob.failedJobsHistoryLimit | int | `1` | The number of failed finished jobs to retain. |
| webserver.export.cronJob.labels | object | `{}` | Additional labels for the cronjob object. |
| webserver.export.cronJob.schedule | string | `"0 4 * * 1"` | Schedule for automated exports. |
| webserver.export.cronJob.successfulJobsHistoryLimit | int | `3` | The number of successful finished jobs to retain. |
| webserver.export.cronJob.suspend | bool | `false` | Enable/disable the cron job schedule quickly. |
| webserver.export.enabled | bool | `false` | Enable the volume mount of an export directory for [backups](https://paperless-ngx.readthedocs.io/en/latest/administration.html#making-backups) using the [document exporter](https://paperless-ngx.readthedocs.io/en/latest/administration.html#utilities-exporter). |
| webserver.export.hostPath | string | `""` | Host path of the export directory outside the container. |
| webserver.export.mountPath | string | `"/usr/src/paperless/export"` | Mount path of the export directory inside the container. |
| webserver.export.nfs.enabled | bool | `false` | Enable NFS for the export directory |
| webserver.export.nfs.path | string | `""` | The path to the directory |
| webserver.export.nfs.readOnly | bool | `false` | Mount the directory read-only. This must be false |
| webserver.export.nfs.server | string | `""` | The NFS server to use |
| webserver.fullnameOverride | string | `""` |  |
| webserver.image.pullPolicy | string | `"IfNotPresent"` | The pull policy for the controller. |
| webserver.image.repository | string | `"ghcr.io/paperless-ngx/paperless-ngx"` | The repository to pull the image from. |
| webserver.image.tag | string | `.Chart.AppVersion` | The docker tag, if left empty chart's appVersion will be used. |
| webserver.ingressRoute.annotations | object | `{}` | Additional annotations for the ingress route object. |
| webserver.ingressRoute.create | bool | `false` | Create an IngressRoute object for exposing this chart. |
| webserver.ingressRoute.entryPoints | list | `[]` | List of [entry points](https://doc.traefik.io/traefik/routing/routers/#entrypoints) on which the ingress route will be available. |
| webserver.ingressRoute.labels | object | `{}` | Additional labels for the ingress route object. |
| webserver.ingressRoute.middlewares | list | `[]` | List of [middleware objects](https://doc.traefik.io/traefik/routing/providers/kubernetes-crd/#kind-middleware) for the ingress route. |
| webserver.ingressRoute.rule | string | `""` | [Matching rule](https://doc.traefik.io/traefik/routing/routers/#rule) for the underlying router. |
| webserver.ingressRoute.tlsSecretName | string | `""` | Use an existing secret containing the TLS certificate. |
| webserver.nameOverride | string | `""` |  |
| webserver.persistentVolumeClaim.accessMode | string | `"ReadWriteOnce"` | Access mode of the persistent volume claim object. |
| webserver.persistentVolumeClaim.annotations | object | `{}` | Additional annotations for the persistent volume claim object. |
| webserver.persistentVolumeClaim.create | bool | `false` | Create a new persistent volume claim object. |
| webserver.persistentVolumeClaim.existingPersistentVolumeClaim | string | `""` | Use an existing persistent volume claim object. |
| webserver.persistentVolumeClaim.labels | object | `{}` | Additional labels for the persistent volume claim object. |
| webserver.persistentVolumeClaim.mountPath | string | `"/usr/src/paperless"` | Mount path of the persistent volume claim object. |
| webserver.persistentVolumeClaim.size | string | `"1Gi"` | Storage request size for the persistent volume claim object. |
| webserver.persistentVolumeClaim.storageClassName | string | `""` | Storage class name for the persistent volume claim object. |
| webserver.persistentVolumeClaim.volumeMode | string | `"Filesystem"` | Volume mode of the persistent volume claim object. |
| webserver.ports.http.enabled | bool | `true` | Enable the port inside the `Deployment` and `Service` objects. |
| webserver.ports.http.nodePort | string | `nil` | The external port used if `.service.type` == `NodePort`. |
| webserver.ports.http.port | int | `8000` | The port used as internal port and cluster-wide port if `.service.type` == `ClusterIP`. |
| webserver.ports.http.protocol | string | `"TCP"` | The protocol used for the service. |
| webserver.rbac.annotations | object | `{}` | Additional annotations for the role and role binding objects. |
| webserver.rbac.create | bool | `true` | Create `Role` and `RoleBinding` objects. |
| webserver.rbac.labels | object | `{}` | Additional labels for the role and role binding objects. |
| webserver.resources | object | `{}` | Compute resources used by the container. More info [here](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/). |
| webserver.secret.annotations | object | `{}` | Additional annotations for the secret object. |
| webserver.secret.create | bool | `true` | Create a new secret containing the [secret key](https://paperless-ngx.readthedocs.io/en/latest/configuration.html#hosting-security). |
| webserver.secret.existingSecret | string | `""` | Use an existing secret to store the [secret key](https://paperless-ngx.readthedocs.io/en/latest/configuration.html#hosting-security). |
| webserver.secret.labels | object | `{}` | Additional labels for the secret object. |
| webserver.secret.secretKey | string | `""` | [Secret key](https://paperless-ngx.readthedocs.io/en/latest/configuration.html#hosting-security) used when not using an existing secret. |
| webserver.securityContext | object | `{}` | Pod-level security attributes. More info [here](https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#security-context). |
| webserver.service.annotations | object | `{}` | Additional annotations for the service object. |
| webserver.service.enabled | bool | `true` | Create a service for exposing this chart. |
| webserver.service.labels | object | `{}` | Additional labels for the service object. |
| webserver.service.type | string | `"ClusterIP"` | The service type used. |
| webserver.serviceAccount.name | string | `""` | Specify the service account used for the controller. |
| webserver.tolerations | object | `{}` | Pod-level tolerations. More info [here](https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#scheduling). |
| webserver.trash.enabled | bool | `false` | Enable the volume mount of a [trash directory](https://paperless-ngx.readthedocs.io/en/latest/configuration.html#paths-and-folders). |
| webserver.trash.hostPath | string | `""` | Host path of the trash directory outside the container. |
| webserver.trash.mountPath | string | `"/trash"` | Mount path of the trash directory inside the container. |
| webserver.trash.nfs.enabled | bool | `false` | Enable NFS for the trash directory |
| webserver.trash.nfs.path | string | `""` | The path to the directory |
| webserver.trash.nfs.server | string | `""` | The NFS server to use |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Aaron Seibert | <aaron@awseibert.net> |  |

## License

[MIT](../LICENSE.md) – © 2023 [Aaron Seibert](https://helm.seibert.family)
