# docker-easyrsa

[![github-actions](https://github.com/theohbrothers/docker-easyrsa/actions/workflows/ci-master-pr.yml/badge.svg?branch=master)](https://github.com/theohbrothers/docker-easyrsa/actions/workflows/ci-master-pr.yml)
[![github-release](https://img.shields.io/github/v/release/theohbrothers/docker-easyrsa?style=flat-square)](https://github.com/theohbrothers/docker-easyrsa/releases/)
[![docker-image-size](https://img.shields.io/docker/image-size/theohbrothers/docker-easyrsa/latest)](https://hub.docker.com/r/theohbrothers/docker-easyrsa)

Dockerized [`easy-rsa`](https://github.com/OpenVPN/easy-rsa).

The base image is `alpine`.

## Tags

| Tag | Dockerfile Build Context |
|:-------:|:---------:|
| `:3.2.2`, `:latest` | [View](variants/3.2.2) |
| `:3.2.1` | [View](variants/3.2.1) |
| `:3.2.0` | [View](variants/3.2.0) |
| `:3.1.7` | [View](variants/3.1.7) |
| `:3.1.6` | [View](variants/3.1.6) |
| `:3.1.5` | [View](variants/3.1.5) |
| `:3.1.4` | [View](variants/3.1.4) |
| `:3.1.3` | [View](variants/3.1.3) |
| `:3.1.2` | [View](variants/3.1.2) |
| `:3.1.1` | [View](variants/3.1.1) |
| `:3.1.0` | [View](variants/3.1.0) |
| `:3.0.9` | [View](variants/3.0.9) |
| `:3.0.8` | [View](variants/3.0.8) |
| `:3.0.7` | [View](variants/3.0.7) |
| `:3.0.6` | [View](variants/3.0.6) |
| `:3.0.5` | [View](variants/3.0.5) |
| `:3.0.4` | [View](variants/3.0.4) |
| `:3.0.3` | [View](variants/3.0.3) |
| `:3.0.2` | [View](variants/3.0.2) |
| `:3.0.1` | [View](variants/3.0.1) |

All images are based on Alpine.

## Usage

In this image, the PKI will be stored in `/data/pki` (i.e. `EASYRSA_PKI=/data/pki`, see Dockerfile).

```sh
# Generate /data/pki
docker run --rm -it -v data:/data theohbrothers/docker-easyrsa:3.2.2 init-pki
# Generate CA, server and client certs
docker run --rm -it -e EASYRSA_BATCH=true -v data:/data theohbrothers/docker-easyrsa:3.2.2 build-ca nopass
docker run --rm -it -e EASYRSA_BATCH=true -v data:/data theohbrothers/docker-easyrsa:3.2.2 build-server-full server-01 nopass
docker run --rm -it -e EASYRSA_BATCH=true -v data:/data theohbrothers/docker-easyrsa:3.2.2 build-client-full client-01 nopass

# Alternatively, a nice one liner to do everything
docker run --rm -it -e EASYRSA_BATCH=true -v data:/data theohbrothers/docker-easyrsa:3.2.2 sh -c 'set -e; easyrsa init-pki; easyrsa build-ca nopass; easyrsa build-server-full server-01 nopass; easyrsa build-client-full client-01 nopass; find /data/pki'
```

According to [`easy-rsa` documentation](https://github.com/OpenVPN/easy-rsa/blob/v3.0.0/doc/EasyRSA-Advanced.md#configuration-reference), there are four ways to run `easy-rsa`, namely:

- Command-line options
- Environment variables
- `vars` file
- Built-in defaults

### Command line

See `easy-rsa` documentation on command line options and their matching environment variables [here](https://github.com/OpenVPN/easy-rsa/blob/v3.0.0/doc/EasyRSA-Readme.md#obtaining-and-using-easy-rsa).

### Environment variables

See `easy-rsa` documentation on environment variables [here](https://github.com/OpenVPN/easy-rsa/blob/v3.0.0/doc/EasyRSA-Advanced.md#environmental-variables-reference).

### `vars` file

See `easy-rsa` documentation on using `vars` file [here](https://github.com/OpenVPN/easy-rsa/blob/v3.0.0/doc/EasyRSA-Advanced.md#vars-autodetection).

See an example of a `vars` file [here](https://github.com/OpenVPN/easy-rsa/blob/v3.0.0/easyrsa3/vars.example).

## Development

Requires Windows `powershell` or [`pwsh`](https://github.com/PowerShell/PowerShell).

```powershell
# Install Generate-DockerImageVariants module: https://github.com/theohbrothers/Generate-DockerImageVariants
Install-Module -Name Generate-DockerImageVariants -Repository PSGallery -Scope CurrentUser -Force -Verbose

# Edit ./generate templates

# Generate the variants
Generate-DockerImageVariants .
```

### Variant versions

[versions.json](generate/definitions/versions.json) contains a list of [Semver](https://semver.org/) versions, one per line.

To update versions in `versions.json`:

```powershell
./Update-Versions.ps1
```

To update versions in `versions.json`, and open a PR for each changed version, and merge successful PRs one after another (to prevent merge conflicts), and finally create a tagged release and close milestone:

```powershell
$env:GITHUB_TOKEN = 'xxx'
./Update-Versions.ps1 -PR -AutoMergeQueue -AutoRelease
```

To perform a dry run, use `-WhatIf`.
