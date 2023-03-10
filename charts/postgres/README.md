

# postgres

Postgres Chart

 ![Version: 0.1.15](https://img.shields.io/badge/Version-0.1.15-informational?style=flat-square)  ![AppVersion: 15.2](https://img.shields.io/badge/AppVersion-15.2-informational?style=flat-square)

## Requirements

- [`helm`](https://helm.sh) - Refer to their [docs](https://helm.sh/docs) to get started.

| Repository | Name | Version |
|------------|------|---------|

## Usage

To use this chart add the repo as follows:

```console
$ helm repo add aaronseibert https://helm.seibert.family
```

If you had already added this repo earlier, run `helm repo update` to retrieve the latest versions of the packages.

To install this chart simply run the following command:

```console
$ helm install postgres aaronseibert/postgres
```

To uninstall this chart simply run the following command:

```console
$ helm delete postgres
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| configMap.postgresDb | string | `"postgresdb"` |  |
| configMap.postgresPassword | string | `"psltest"` |  |
| configMap.postgresUser | string | `"admin"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"postgres"` |  |
| image.tag | string | `""` |  |
| nameOverride | string | `""` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.enabled | bool | `false` |  |
| persistence.existingClaim | string | `""` |  |
| persistence.size | string | `"1Gi"` |  |
| persistence.storageClass | string | `""` |  |
| podAnnotations | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| service.port | int | `5432` |  |
| service.targetPort | string | `"postgresql"` |  |
| service.type | string | `"ClusterIP"` |  |

## License

[MIT](../LICENSE.md) – © 2023 [Aaron Seibert](https://helm.seibert.family)