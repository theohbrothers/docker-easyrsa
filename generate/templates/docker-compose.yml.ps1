@"
version: '2.1'
services:
  easy-rsa:
    container_name: easyrsa
    image: theohbrothers/docker-easyrsa:$( $VARIANT['tag'] )

    # Uncomment this to specify the path to your own mounted openssl.cnf in a different location from the default location
    # environment:
      # - EASYRSA_SSL_CONF=/etc/ssl/openssl.cnf

    # Uncomment this to mount your own openssl.cnf, vars file(s)
    # volumes:
      # - ./path/to/openssl.conf:/etc/ssl/openssl.cnf
      # Using environment variables is preferred to using a vars file
      # - ./path/to/vars:/etc/ssl/openssl.cnf
"@
