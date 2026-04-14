FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends python3-pip bash \
    && rm -rf /var/lib/apt/lists/*

COPY . /wyoming-whisper-api-client
RUN pip3 install --no-cache-dir --break-system-packages -r wyoming-whisper-api-client/requirements.txt

WORKDIR /wyoming-whisper-api-client/
RUN chmod +x run.sh

ENTRYPOINT ["bash", "/wyoming-whisper-api-client/run.sh"]
