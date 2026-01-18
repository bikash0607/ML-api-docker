#!/bin/bash
# Complete Docker permission fix

echo "Step 1: Ensuring docker group exists..."
sudo groupadd docker 2>/dev/null

echo "Step 2: Adding $USER to docker group..."
sudo usermod -aG docker $USER

echo "Step 3: Fixing Docker socket ownership..."
sudo chown root:docker /var/run/docker.sock
sudo chmod 660 /var/run/docker.sock

echo "Step 4: Setting up snap docker interface..."
sudo snap connect docker:docker-daemon

echo ""
echo "✓ All Docker permissions configured!"
echo ""
echo "=========================================="
echo "NEXT STEPS (choose one):"
echo "=========================================="
echo ""
echo "Option 1: Run this command in YOUR terminal:"
echo "  newgrp docker"
echo ""
echo "Option 2: Log out and log back in"
echo ""
echo "Then test with: docker ps"
echo "=========================================="
