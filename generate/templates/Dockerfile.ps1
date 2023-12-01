@"
FROM $( $VARIANT['_metadata']['distro'] ):$( $VARIANT['_metadata']['distro_version'] )
ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on `$BUILDPLATFORM, building for `$TARGETPLATFORM"

RUN apk add --no-cache ca-certificates

# Install easyrsa dependencies
RUN apk add --no-cache openssl

WORKDIR /data
ENV EASYRSA=/usr/share/easy-rsa
ENV EASYRSA_PKI=/data/pki

# Install easyrsa
# See: https://github.com/OpenVPN/easy-rsa/tree/master/release-keys
RUN set -eux; \
    apk add --no-cache gnupg gpg-agent dirmngr; \
    URL=https://github.com/OpenVPN/easy-rsa/releases/download/$(
        if ([version]$VARIANT['_metadata']['package_version'] -le [version]'3.0.1') { $VARIANT['_metadata']['package_version'] }
        else { "v$( $VARIANT['_metadata']['package_version'] )" }
    )/$(
        # The prefix for the .tgz file is inconsistent
        if ([version]$VARIANT['_metadata']['package_version'] -ge [version]'3.1.0') { 'EasyRSA-' }
        elseif ([version]$VARIANT['_metadata']['package_version'] -eq [version]'3.0.9') { 'EasyRSA-v' }
        elseif ([version]$VARIANT['_metadata']['package_version'] -eq [version]'3.0.8') { 'EasyRSA-' }
        elseif ([version]$VARIANT['_metadata']['package_version'] -eq [version]'3.0.7') { 'EasyRSA-' }
        elseif ([version]$VARIANT['_metadata']['package_version'] -eq [version]'3.0.6') { 'EasyRSA-unix-v' }
        elseif ([version]$VARIANT['_metadata']['package_version'] -eq [version]'3.0.5') { 'EasyRSA-nix-' }
        elseif ([version]$VARIANT['_metadata']['package_version'] -le [version]'3.0.4') { 'EasyRSA-' }
    )$( $VARIANT['_metadata']['package_version'] ).tgz; \
    FILE=`$( basename `$URL ); \
    wget -q "`$URL"; \
    wget -q "`$URL.sig"; \
    gpg --keyserver keys.openpgp.org --recv-keys 6F4056821152F03B6B24F2FCF8489F839D7367F3; \
    gpg --verify "`$FILE.sig" "`$FILE"; \
    mkdir -p /usr/share/easy-rsa; \
    tar -zxvf "`$FILE" --strip-components=1 -C /usr/share/easy-rsa; \
    ln -sf /usr/share/easy-rsa/easyrsa /usr/local/bin/easyrsa; \
    \
    easyrsa help; \
    easyrsa init-pki; \
    rm -rfv /data/pki; \
    \
    rm -fv "`$FILE"; \
    rm -fv "`$FILE.sig"; \
    apk del gnupg gpg-agent dirmngr; \
    killall dirmngr; \
    killall gpg-agent; \
    # Fix error: rm: can't remove '/root/.gnupg/S.gpg-agent.extra': No such file or directory
    while ls /root/.gnupg/S.* > /dev/null; do \
        echo "Waiting for gpg sockets to be removed"; \
        sleep 1; \
    done; \
    rm -rf /root/.gnupg;

VOLUME /data

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

"@
