

FROM alpine:3.12

RUN apk add --no-cache easy-rsa=3.0.7-r0 iptables

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# alpine easyrsa top-level directory. Use command find / -name 'easyrsa'
RUN echo "Looking for easyrsa binary" \
    && find / -name 'easyrsa'
ENV EASYRSA=/usr/share/easy-rsa

# alpine openssl.cnf location. Use command find / -name 'openssl*.cnf'
# <  v3.0.4: https://github.com/OpenVPN/easy-rsa/blob/v3.0.0/easyrsa3/easyrsa#L1032-L1033
# >= v3.0.4: https://github.com/OpenVPN/easy-rsa/blob/v3.0.4/easyrsa3/easyrsa#L1091-L1092
RUN echo "Looking for openssl.cnf" \
    && find / -name 'openssl*.cnf'

ENTRYPOINT ["/docker-entrypoint.sh"]

