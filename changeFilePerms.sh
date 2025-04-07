#!/bin/bash

# Absolute paths to your ELK config files
FILES=(
  "/etc/elasticsearch/elasticsearch.yml"
  "/etc/logstash/logstash.yml"
  "/etc/kibana/kibana.yml"
)

echo "[*] Changing ownership and permissions on ELK config files..."

for file in "${FILES[@]}"; do
  if [ -f "$file" ]; then
    sudo chown root:root "$file"
    sudo chmod 600 "$file"
    echo "[+] Secured $file"
  else
    echo "[!] File not found: $file"
  fi
done

echo "[*] Done. Only root can now access ELK configuration files."


