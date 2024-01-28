FROM maven:3.9.6-eclipse-temurin-11-alpine AS FINAL
LABEL org.opencontainers.image.authors="Andrea Zuccherelli (https://github.com/andzuc)"

RUN apk add gnupg

FROM scratch AS BUILDER
COPY --from=FINAL / /
WORKDIR /opt
ADD --link https://downloads.apache.org/netbeans/KEYS .
ADD --link https://downloads.apache.org/netbeans/netbeans/20/netbeans-20-bin.zip.asc .
ADD --link https://dlcdn.apache.org/netbeans/netbeans/20/netbeans-20-bin.zip .
RUN export PRODUCT_TAR="$(ls -ct|head -1)" \
    && gpg --import KEYS \
    && gpg --verify "${PRODUCT_TAR}.asc" "${PRODUCT_TAR}"
