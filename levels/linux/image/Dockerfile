FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
      curl procps iproute2 cron openssh-client vim less jq net-tools python3 \
      sudo file lsof dos2unix ca-certificates \
    && rm -rf /var/lib/apt/lists/*
RUN groupadd ops && groupadd dev && groupadd operators \
    && useradd -m -s /bin/bash app \
    && useradd -m -s /bin/bash deploy \
    && useradd -m -s /bin/bash -G dev,operators alice \
    && useradd -m -s /bin/bash -G dev bob
CMD ["sleep","infinity"]
