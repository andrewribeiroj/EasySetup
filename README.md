# EasySetup
Shell Script that execute several commands to setup a Ubuntu 20.04 workspace with some common tools automatically, with special workarounds for VPN issues.

Designed for users that are not familiar with Linux and command line, that need to setup their workspace easily.

Automatically installs:
- Snap
- Wget
- Nordlayer
- Nordpass
- Slack
- Google Chrome
- Flameshot
- Filezilla

Extras:
- Custom commands to VPN management (avoiding recurring gateways check)
- IPv6 leak solution (disabling via GRUB)

Special sha256sum check is usually done before running the script.
