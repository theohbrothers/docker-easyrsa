# docker-easyrsa

[![github-actions](https://github.com/theohbrothers/docker-easyrsa/workflows/ci-master-pr/badge.svg)](https://github.com/theohbrothers/docker-easyrsa/actions)
[![github-release](https://img.shields.io/github/v/release/theohbrothers/docker-easyrsa?style=flat-square)](https://github.com/theohbrothers/docker-easyrsa/releases/)
[![docker-image-size](https://img.shields.io/docker/image-size/theohbrothers/docker-easyrsa/latest)](https://hub.docker.com/r/theohbrothers/docker-easyrsa)

Dockerized [`easy-rsa`](https://github.com/OpenVPN/easy-rsa).

The base image is `alpine`.

## Tags

| Tag | Dockerfile Build Context |
|:-------:|:---------:|
| `:v3.1.5`, `:latest` | [View](variants/v3.1.5) |
| `:v3.1.4` | [View](variants/v3.1.4) |
| `:v3.1.3` | [View](variants/v3.1.3) |
| `:v3.1.2` | [View](variants/v3.1.2) |
| `:v3.1.1` | [View](variants/v3.1.1) |
| `:v3.1.0` | [View](variants/v3.1.0) |
| `:v3.0.8` | [View](variants/v3.0.8) |
| `:v3.0.7` | [View](variants/v3.0.7) |
| `:v3.0.6` | [View](variants/v3.0.6) |
| `:v3.0.5` | [View](variants/v3.0.5) |
| `:v3.0.4` | [View](variants/v3.0.4) |
| `:v3.0.3` | [View](variants/v3.0.3) |
| `:v3.0.2` | [View](variants/v3.0.2) |
| `:v3.0.1` | [View](variants/v3.0.1) |

All images are based on Alpine.

## Usage

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
