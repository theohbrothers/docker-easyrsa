@"
# docker-easyrsa

[![github-actions](https://github.com/theohbrothers/docker-easyrsa/workflows/build/badge.svg)](https://github.com/theohbrothers/docker-easyrsa/actions)
[![github-tag](https://img.shields.io/github/tag/theohbrothers/docker-easyrsa)](https://github.com/theohbrothers/docker-easyrsa/releases/)
[![docker-image-size](https://img.shields.io/microbadger/image-size/theohbrothers/docker-easyrsa/latest)](https://hub.docker.com/r/theohbrothers/docker-easyrsa)
[![docker-image-layers](https://img.shields.io/microbadger/layers/theohbrothers/docker-easyrsa/latest)](https://hub.docker.com/r/theohbrothers/docker-easyrsa)

Based on [``easy-rsa``](https://github.com/OpenVPN/easy-rsa).

## Tags

| Tags |
|:-------:|
$(
($VARIANTS | % {
    if ( $_['tag_as_latest'] ) {
@"
| ``:$( $_['tag'] )``, ``:latest`` |

"@
    }else {
@"
| ``:$( $_['tag'] )`` |

"@
    }
}) -join ''
)

## Configuration

According to [``easy-rsa`` documentation](https://github.com/OpenVPN/easy-rsa/blob/v3.0.0/doc/EasyRSA-Advanced.md#configuration-reference), there are four ways to run ``easy-rsa``, namely:

1. Command-line options
2. Environment variables
3. ``vars`` file
4. Built-in defaults

### Command line

See ``easy-rsa`` documentation on command line options and their matching environment variables [here](https://github.com/OpenVPN/easy-rsa/blob/v3.0.0/doc/EasyRSA-Readme.md#obtaining-and-using-easy-rsa).

### Environment variables

See ``easy-rsa`` documentation on environment variables [here](https://github.com/OpenVPN/easy-rsa/blob/v3.0.0/doc/EasyRSA-Advanced.md#environmental-variables-reference).

### ``vars`` file.

See ``easy-rsa`` documentation on using ``vars`` file [here](https://github.com/OpenVPN/easy-rsa/blob/v3.0.0/doc/EasyRSA-Advanced.md#vars-autodetection).

See an example of a ``vars`` file [here](https://github.com/OpenVPN/easy-rsa/blob/v3.0.0/easyrsa3/vars.example).
"@
