#!/bin/bash
# Script to set up SSH keys for GitHub

echo "Generating SSH key for GitHub..."
ssh-keygen -t ed25519 -C "bikashmhto2002@gmail.com" -f ~/.ssh/id_ed25519 -N ""

echo ""
echo "=========================================="
echo "SSH Key Generated!"
echo "=========================================="
echo ""
echo "Your public key is:"
echo ""
cat ~/.ssh/id_ed25519.pub
echo ""
echo "=========================================="
echo "Next steps:"
echo "=========================================="
echo "1. Copy the public key above"
echo "2. Go to: https://github.com/settings/keys"
echo "3. Click 'New SSH key'"
echo "4. Paste the key and save"
echo "5. Then run: git push -u origin main"
echo "=========================================="
