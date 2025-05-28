#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# === 1. Update system and install dependencies ===
echo "[+] Updating system and installing dependencies (Git, Maven, Java 23)..."
sudo apt update
sudo apt install -y git wget unzip curl

# Install Java 23 from Adoptium (Temurin)
echo "[+] Installing Java 23 (Temurin)..."
curl -fsSL https://packages.adoptium.net/artifactory/api/gpg/key/public | sudo gpg --dearmor -o /usr/share/keyrings/adoptium-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/adoptium-archive-keyring.gpg] https://packages.adoptium.net/artifactory/deb jammy main" | sudo tee /etc/apt/sources.list.d/adoptium.list > /dev/null
sudo apt update && sudo apt install -y temurin-23-jdk

# === 2. Clone WebGoat Repository ===
echo "[+] Cloning WebGoat repository..."
cd /home/azureuser
git clone https://github.com/WebGoat/WebGoat.git
cd WebGoat

# === 3. Build the Project ===
echo "[+] Building WebGoat with Maven Wrapper..."
chmod +x mvnw
./mvnw clean install -DskipTests

# === 4. Run WebGoat ===
echo "[+] Starting WebGoat on port 8080..."
./mvnw spring-boot:run -Dspring-boot.run.arguments="--server.address=0.0.0.0" &

# === 5. Summary ===
echo "------------------------------------------------------------"
echo "[✓] WebGoat is now running in the background!"
echo "[→] Access it at: http://<your-vm-public-ip>:8080/WebGoat"
echo "[→] Default credentials → Username: guest | Password: guest"
echo "[→] Logs → ~/WebGoat/webgoat.log"
echo "------------------------------------------------------------"
