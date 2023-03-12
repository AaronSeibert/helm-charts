

# postgres

Postgres Chart

 ![Version: 0.1.17](https://img.shields.io/badge/Version-0.1.17-informational?style=flat-square)  ![AppVersion: 15.2](https://img.shields.io/badge/AppVersion-15.2-informational?style=flat-square)

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
$ helm install postgres aaronseibert/postgres
```

To uninstall this chart simply run the following command:

```console
$ helm delete postgres
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` |  |
| image.repository | string | `"postgres"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.tag | string | `""` |  |
| persistence.enabled | bool | `false` |  |
| persistence.existingClaim | string | `""` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.storageClass | string | `""` |  |
| persistence.size | string | `"1Gi"` |  |
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| podAnnotations | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| service.targetPort | string | `"postgresql"` |  |
| service.port | int | `5432` |  |
| configMap.postgresDb | string | `"postgresdb"` |  |
| configMap.postgresUser | string | `"admin"` |  |
| configMap.postgresPassword | string | `"psltest"` |  |
| resources | object | `{}` |  |

## License

[MIT](../LICENSE.md) – © 2023 [Aaron Seibert](https://helm.seibert.family)
