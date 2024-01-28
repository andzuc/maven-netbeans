FROM maven:3.9.6-eclipse-temurin-11-alpine AS BASE
LABEL org.opencontainers.image.authors="Andrea Zuccherelli (https://github.com/andzuc)"
RUN apk add --no-cache \
    xauth xeyes \
    gnupg git


FROM scratch AS BUILDER
COPY --from=BASE / /
WORKDIR /opt
ADD --link https://downloads.apache.org/netbeans/KEYS .
ADD --link https://downloads.apache.org/netbeans/netbeans/20/netbeans-20-bin.zip.asc .
ADD --link https://dlcdn.apache.org/netbeans/netbeans/20/netbeans-20-bin.zip .
RUN export PRODUCT_TAR="$(ls -ct|head -1)" \
    && gpg --import KEYS \
    && gpg --verify "${PRODUCT_TAR}.asc" "${PRODUCT_TAR}" \
    && unzip "${PRODUCT_TAR}"

FROM scratch AS FINAL
COPY --from=BASE / /
COPY --from=BUILDER /opt/netbeans /opt/netbeans
ENV PATH="${PATH}:/opt/java/openjdk/bin"
ENV JAVA_HOME="/opt/java/openjdk"
# setup netbeans user
RUN addgroup -S netbeans && adduser -S netbeans -G netbeans
USER netbeans
# setup X environment
WORKDIR /home/netbeans
COPY xsetup.sh .
ENTRYPOINT [ "/home/netbeans/xsetup.sh" ]
