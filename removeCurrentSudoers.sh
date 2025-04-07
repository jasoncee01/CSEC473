#!/bin/bash

# Users to remove from sudo group
USERS=("Alex" "Steve" "Notch")

echo "[*] Removing users from the sudo group..."

for user in "${USERS[@]}"; do
  if id "$user" &>/dev/null; then
    sudo deluser "$user" sudo
    echo "[+] Removed $user from sudo group."
  else
    echo "[!] User $user does not exist."
  fi
done

echo "[*] Done. The specified users no longer have sudo privileges."

