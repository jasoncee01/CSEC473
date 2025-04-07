#!/bin/bash

# Script to create 10 privileged users with passwords like BlueTeam1, BlueTeam2...

for i in {1..10}; do
    username="user$i"
    password="!BlueTeam$i"

    echo "Creating $username with password $password..."

    # Create the user without prompting
    sudo useradd -m -s /bin/bash "$username"

    # Set the password
    echo "$username:$password" | sudo chpasswd

    # Add user to sudoers
    sudo usermod -aG sudo "$username"

    echo "$username created and added to sudo group."
done

echo "All users created successfully."

