FROM debian:stretch-slim

RUN apt-get update \
    && apt-get install -y \
		ca-certificates  \
		curl \
        gnupg2 \
        nano \
        --no-install-recommends \
    && curl -O http://repo.yandex.ru/yandex-disk/yandex-disk_latest_amd64.deb \
    && dpkg -i yandex-disk_latest_amd64.deb \
    && rm -r /var/lib/apt/lists/*

ARG user
ARG pwd

# COPY config.cfg /root/.config/yandex-disk/config.cfg
VOLUME [ "/root" ]

CMD ["yandex-disk", "start", "--no-daemon", "--dir=/ydisk"]
