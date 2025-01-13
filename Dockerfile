FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    python3-pip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/geoffwhittington/meshtastic-matrix-relay.git /app

WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "main.py"]