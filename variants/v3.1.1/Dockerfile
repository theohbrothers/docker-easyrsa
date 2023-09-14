FROM alpine:3.17
ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM"

RUN apk add --no-cache ca-certificates

# Install easyrsa dependencies
RUN apk add --no-cache iptables openssl

# Install easyrsa
# See: https://github.com/OpenVPN/easy-rsa/tree/master/release-keys
RUN set -eux; \
    apk add --no-cache gnupg gpg-agent dirmngr; \
    URL=https://github.com/OpenVPN/easy-rsa/releases/download/v3.1.1/EasyRSA-3.1.1.tgz; \
    FILE=$( basename $URL ); \
    wget -q "$URL"; \
    wget -q "$URL.sig"; \
    gpg --keyserver keys.openpgp.org --recv-keys 6F4056821152F03B6B24F2FCF8489F839D7367F3; \
    gpg --verify "$FILE.sig" "$FILE"; \
    mkdir -p /usr/share/easy-rsa; \
    tar -zxvf "$FILE" --strip-components=1 -C /usr/share/easy-rsa; \
    /usr/share/easy-rsa/easyrsa help; \
    rm -fv "$FILE"; \
    rm -fv "$FILE.sig"; \
    rm -rf /root/.gnupg; \
    apk del gnupg gpg-agent dirmngr;

ENV EASYRSA=/usr/share/easy-rsa
WORKDIR /usr/share/easy-rsa

# alpine openssl.cnf location. Use command find / -name 'openssl*.cnf'
# <  v3.0.4: https://github.com/OpenVPN/easy-rsa/blob/v3.0.0/easyrsa3/easyrsa#L1032-L1033
# >= v3.0.4:
RUN echo "Looking for openssl.cnf" \
    && find /etc /usr -name 'openssl*.cnf'

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
