# docker-easyrsa

[![github-actions](https://github.com/theohbrothers/docker-easyrsa/workflows/build/badge.svg)](https://github.com/theohbrothers/docker-easyrsa/actions)
[![github-tag](https://img.shields.io/github/tag/theohbrothers/docker-easyrsa)](https://github.com/theohbrothers/docker-easyrsa/releases/)
[![docker-image-size](https://img.shields.io/microbadger/image-size/theohbrothers/docker-easyrsa/latest)](https://hub.docker.com/r/theohbrothers/docker-easyrsa)
[![docker-image-layers](https://img.shields.io/microbadger/layers/theohbrothers/docker-easyrsa/latest)](https://hub.docker.com/r/theohbrothers/docker-easyrsa)

Based on [`easy-rsa`](https://github.com/OpenVPN/easy-rsa).

# Tags

| Tags |
|:-------:|
| `:v3.0.1-alpine-3.3` |
| `:v3.0.1-alpine-3.4` |
| `:v3.0.1-alpine-3.5` |
| `:v3.0.1-alpine-3.6` |
| `:v3.0.3-alpine-3.7` |
| `:v3.0.4-alpine-3.8` |
| `:v3.0.5-alpine-3.9` |
| `:v3.0.6-alpine-3.10` |
| `:v3.0.6-alpine-3.11` |
| `:v3.0.7-alpine-3.12`, `:latest` |


## Configuration

According to [`easy-rsa` documentation](https://github.com/OpenVPN/easy-rsa/blob/v3.0.0/doc/EasyRSA-Advanced.md#configuration-reference), there are four ways to run `easy-rsa`, namely:

1. Command-line options
2. Environment variables
3. `vars` file
4. Built-in defaults

### Command line

See `easy-rsa` documentation on command line options and their matching environment variables [here](https://github.com/OpenVPN/easy-rsa/blob/v3.0.0/doc/EasyRSA-Readme.md#obtaining-and-using-easy-rsa).

### Environment variables

See `easy-rsa` documentation on environment variables [here](https://github.com/OpenVPN/easy-rsa/blob/v3.0.0/doc/EasyRSA-Advanced.md#environmental-variables-reference).

### `vars` file.

See `easy-rsa` documentation on using `vars` file [here](https://github.com/OpenVPN/easy-rsa/blob/v3.0.0/doc/EasyRSA-Advanced.md#vars-autodetection).

See an example of a `vars` file [here](https://github.com/OpenVPN/easy-rsa/blob/v3.0.0/easyrsa3/vars.example).