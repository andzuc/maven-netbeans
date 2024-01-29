FROM maven:3.9.6-eclipse-temurin-11 AS BASE
LABEL org.opencontainers.image.authors="Andrea Zuccherelli (https://github.com/andzuc)"
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    xauth x11-apps libxtst6 libxi6 \
    git

FROM scratch AS BUILDER
COPY --from=BASE / /
RUN apt-get install -y --no-install-recommends \
    unzip gpg gpg-agent
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
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
ENV PATH="${PATH}:/opt/java/openjdk/bin"
ENV JAVA_HOME="/opt/java/openjdk"
# setup netbeans user
RUN useradd -m netbeans
USER netbeans
# setup X environment
WORKDIR /home/netbeans
COPY xsetup.sh .
ENTRYPOINT [ "/home/netbeans/xsetup.sh" ]
