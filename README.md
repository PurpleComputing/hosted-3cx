# Hosted 3CX Installer

Automated installation script for [3CX PBX](https://www.3cx.com/) on Debian 12.

## Requirements

- Debian 12 (Bookworm)
- Root / sudo access
- Active internet connection

## Quick Start

Run the following command on your Debian 12 server:

```bash
curl -sSL https://raw.githubusercontent.com/PurpleComputing/hosted-3cx/main/install-3cx.sh | sudo bash
```

Or using `wget`:

```bash
wget -qO- https://raw.githubusercontent.com/PurpleComputing/hosted-3cx/main/install-3cx.sh | sudo bash
```

## What It Does

1. Verifies the script is running as root on Debian 12
2. Downloads and runs the official 3CX post-install setup script
3. Installs the `3cxpbx` package via apt

Once complete, the 3CX setup wizard should start automatically. If it doesn't, run:

```bash
sudo 3CXWizard
```

## License

MIT

---

Maintained by [Purple Computing](https://github.com/PurpleComputing)
