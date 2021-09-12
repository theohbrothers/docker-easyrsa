@"
FROM $( $VARIANT['_metadata']['distro'] ):$( $VARIANT['_metadata']['distro_version'] )

RUN apk add --no-cache $( $VARIANT['_metadata']['package'] )=$( $VARIANT['_metadata']['package_version'] ) iptables

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# alpine easyrsa top-level directory. Use command find / -name 'easyrsa'
RUN echo "Looking for easyrsa binary" \
    && ls '/usr/share/easy-rsa/easyrsa'
ENV EASYRSA=/usr/share/easy-rsa

WORKDIR /usr/share/easy-rsa

# alpine openssl.cnf location. Use command find / -name 'openssl*.cnf'
# <  v3.0.4: https://github.com/OpenVPN/easy-rsa/blob/v3.0.0/easyrsa3/easyrsa#L1032-L1033
# >= v3.0.4:
RUN echo "Looking for openssl.cnf" \
    && find /etc /usr -name 'openssl*.cnf'

ENTRYPOINT ["/docker-entrypoint.sh"]

"@
