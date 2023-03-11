

# paperless

An umbrella chart for Paperless

![Version: 0.1.14](https://img.shields.io/badge/Version-0.1.14-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.9.2](https://img.shields.io/badge/AppVersion-1.9.2-informational?style=flat-square)

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
| database.postgres | object | See [values.yaml](https://github.com/AaronSeibert/helm-charts/tree/main/charts/postgres/values.yaml) | Enable and configure [postgres subchart](https://github.com/AaronSeibert/helm-charts/tree/main/charts/postgres) under this key. |
| broker.redis | object | See [values.yaml](https://github.com/AaronSeibert/helm-charts/tree/main/charts/redis/values.yaml) | Enable and configure [redis subchart](https://github.com/AaronSeibert/helm-charts/tree/main/charts/redis) under this key. |
| webserver | object | See [values.yaml](https://github.com/AaronSeibert/helm-charts/tree/main/charts/paperless-ngx/values.yaml) | Enable and configure [paperless-ngx subchart](https://github.com/AaronSeibert/helm-charts/tree/main/charts/paperless-ngx) under this key. |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Aaron Seibert | <aaron@awseibert.net> |  |

## License

[MIT](../LICENSE.md) – © 2023 [Aaron Seibert](https://helm.seibert.family)