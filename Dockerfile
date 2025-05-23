FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    python3-pip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install mmrelay

CMD ["mmrelay"]
