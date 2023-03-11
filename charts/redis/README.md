

# redis

redis chart for applications with redis as a dependency

 ![Version: 0.1.9](https://img.shields.io/badge/Version-0.1.9-informational?style=flat-square)  ![AppVersion: 7.0.9](https://img.shields.io/badge/AppVersion-7.0.9-informational?style=flat-square)

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
$ helm install redis aaronseibert/redis
```

To uninstall this chart simply run the following command:

```console
$ helm delete redis
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` |  |
| image.repository | string | `"redis"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| podAnnotations | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `6379` |  |
| service.protocol | string | `"TCP"` |  |
| service.targetPort | string | `"redis"` |  |
| service.name | string | `"redis"` |  |
| persistence.enabled | bool | `false` |  |
| resources | object | `{}` |  |

## License

[MIT](../LICENSE.md) – © 2023 [Aaron Seibert](https://helm.seibert.family)
