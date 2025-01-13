# Meshtastic-Matrix-Relay with Docker

This repository provides a Dockerized setup for running the [Meshtastic-Matrix-Relay](https://github.com/geoffwhittington/meshtastic-matrix-relay) application, enabling message relays between Matrix and Meshtastic networks.

## Prerequisites
- **Docker** and **Docker Compose** installed
- A Matrix homeserver with:
  - **Homeserver URL**
  - **Access token**
  - **Bot user ID**
- Meshtastic device or network configured and accessible

## Getting Started

### Step 1: Clone the Repository
Clone this repository to your local machine:
```bash
git clone https://github.com/mcules/docker-mmrelay.git
cd docker-mmrelay
```

### Step 2: Register a Matrix Bot
Follow the [T2Bot Access Token Guide](https://t2bot.io/docs/access_tokens/) to:
1. Register a bot account on your Matrix homeserver.
2. Get the **access token** for the bot.
3. Note down the bot's **user ID** and **access token** for later configuration.

### Step 3: Obtain the Sample Configuration
Download the [sample configuration file](https://github.com/geoffwhittington/meshtastic-matrix-relay/blob/main/sample_config.yaml) and save it as `config.yaml` in the root of the repository:
```bash
wget https://github.com/geoffwhittington/meshtastic-matrix-relay/blob/main/sample_config.yaml -O config.yaml
```

Edit the `config.yaml` file to match your environment. Below is an overview of the key sections:

#### Matrix Configuration
```yaml
matrix:
  homeserver: https://matrix.domain.tld
  access_token: YOUR_ACCESS_TOKEN
  bot_user_id: "@meshtastic_bot:matrix.domain.tld"
```
- Replace `https://matrix.domain.tld` with your Matrix homeserver URL.
- Add your bot’s **access token** and **user ID**.

#### Matrix Rooms
```yaml
matrix_rooms:
    meshtastic_channel: 2
  - id: "#meshtastic@myChannel:matrix.domain.tld"
```
- Define the Matrix rooms to relay messages to/from Meshtastic channels.

#### Meshtastic Configuration
```yaml
meshtastic:
  connection_type: network
  host: 192.168.1.2
  broadcast_enabled: true
  detection_sensor: true
  plugin_response_delay: 3
  relay_reactions: true
```
- Set `connection_type` to `network`, `serial`, or `ble` based on your setup.
- Configure `host` or other parameters (e.g., `serial_port` or `ble_address`) as needed.

### Step 4: Start the Application
Start the container with Docker Compose:
```bash
docker-compose up -d
```

### Step 5: Verify the Setup
Check the logs to ensure the application is running correctly:
```bash
docker logs meshtastic-relay
```

### Configuration Changes
You can compare your configuration to the [sample config file](https://raw.githubusercontent.com/geoffwhittington/meshtastic-matrix-relay/refs/heads/main/sample_config.yaml). Key differences in this setup:
- **Matrix:**
  - Added homeserver URL, access token, and bot user ID.
- **Matrix Rooms:**
  - Defined one room with a specific Meshtastic channel.
- **Meshtastic:**
  - Set to `network` connection with a defined host IP.
  - Enabled broadcasting, sensor detection, and reaction relays.

## Additional Information
- For more details on the Meshtastic-Matrix-Relay application, refer to the [original repository](https://github.com/geoffwhittington/meshtastic-matrix-relay).
- To stop the container:
  ```bash
  docker-compose down
  ```
- To update the application:
  ```bash
  docker-compose pull
  docker-compose up -d
  ```

---
Feel free to open an issue or submit a pull request if you encounter problems or want to contribute.

