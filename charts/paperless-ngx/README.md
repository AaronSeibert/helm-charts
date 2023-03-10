

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
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `""` |  |
| image.tag | string | `""` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| ingressRoute | object | `{"enabled":false}` | Configure the IngressRoute resource for Traefik CRD |
| ingressRoute.enabled | bool | `false` | Enable IngressRoute. Creates IngressRoute resources for any web endpoints for this application |
| nameOverride | string | `""` |  |
| persistence | object | `{"accessMode":"ReadWriteOnce","enabled":false,"existingClaim":"","size":"1Gi","storageClass":""}` | Configure persistence settings for the application |
| persistence.accessMode | string | `"ReadWriteOnce"` | [Access Modes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes) |
| persistence.enabled | bool | `false` | Enable Persistence. Creates Persistent Volume Claims (or uses existing claims) and adds the volume definitions in the deployment |
| persistence.existingClaim | string | `""` | Uses an existing PVC, specify the PVC name |
| persistence.size | string | `"1Gi"` | Volume Size |
| persistence.storageClass | string | `""` | StorageClass to use for volumes |
| podAnnotations | object | `{}` |  |
| postgres | object | `{}` | Values for postgres dependency |
| redis | object | `{}` | Values for redis dependency |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| service | object | `{"port":80,"type":"ClusterIP"}` | Configure the service |

## License

[MIT](../LICENSE.md) – © 2023 [Aaron Seibert](https://helm.seibert.family)