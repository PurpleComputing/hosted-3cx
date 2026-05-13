#!/bin/bash
set -e

# 3CX PBX Installation Script for Debian 12
# Usage: curl -sSL https://raw.githubusercontent.com/PurpleComputing/hosted-3cx/main/install-3cx.sh | sudo bash

# --- Pre-flight checks ---
if [[ $EUID -ne 0 ]]; then
  echo "Error: This script must be run as root (use sudo)."
  exit 1
fi

if ! grep -q 'VERSION_ID="12"' /etc/os-release 2>/dev/null; then
  echo "Warning: This script is intended for Debian 12. Proceed at your own risk."
  read -rp "Continue anyway? [y/N]: " confirm
  [[ "$confirm" =~ ^[Yy]$ ]] || exit 1
fi

echo "============================================"
echo "  3CX PBX Installer — Debian 12"
echo "============================================"

# --- Step 1: Download and run the 3CX post-install script ---
echo ""
echo "[1/2] Running 3CX post-install setup..."

wget -O /tmp/post-install \
  http://downloads-global.3cx.com/downloads/debian12iso/post-install_12.1.0_46a7ea2.txt

chmod +x /tmp/post-install
bash /tmp/post-install
#bash /usr/local/bin/post-install

# --- Step 2: Install 3CX PBX ---
echo ""
echo "[2/2] Installing 3CX PBX package..."

apt-get update
apt-get install -y 3cxpbx

echo ""
echo "============================================"
echo "  3CX PBX installation complete!"
echo "============================================"
echo ""
echo "Run 'sudo 3CXWizard' if the setup wizard"
echo "does not start automatically."
