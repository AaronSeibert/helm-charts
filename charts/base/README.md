

# base

Base Helm Chart

![Version: 1.0.5](https://img.shields.io/badge/Version-1.0.5-informational?style=flat-square) ![Type: library](https://img.shields.io/badge/Type-library-informational?style=flat-square)

## Source Code

* <https://github.com/aaronseibert/helm-charts>

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
$ helm install base aaronseibert/base
```

To uninstall this chart simply run the following command:

```console
$ helm delete base
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| aaronseibert | <aaron@awseibert.net> |  |

## License

[MIT](../LICENSE.md) – © 2023 [Aaron Seibert](https://helm.seibert.family)
