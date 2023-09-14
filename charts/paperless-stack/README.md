

# paperless

An umbrella chart for Paperless-NGX.

![Version: 0.1.30](https://img.shields.io/badge/Version-0.1.30-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.9.2](https://img.shields.io/badge/AppVersion-1.9.2-informational?style=flat-square)

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

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Aaron Seibert | <aaron@awseibert.net> |  |

## License

[MIT](../LICENSE.md) – © 2023 [Aaron Seibert](https://helm.seibert.family)
