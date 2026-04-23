# Bash Scripts

Archive of shell scripts — some for Debian, some for Arch Linux.  Many are deprecated or incomplete.  **Use at your own risk.**

## Scripts

**imgburn.sh** — `dd` an ISO image to a USB drive.
```bash
# ./imgburn.sh <image.iso> /dev/sdX
# Example: ./imgburn.sh ubuntu.iso /dev/sdb
```
> **Danger**: This uses `dd` without safety checks. Double-check the device path to avoid erasing wrong drives.

**old_scripts/installer.sh** — System setup/archive script. Installs:
- Vundle.vim (Vim plugin manager)
- GNOME settings helpers (GwE function)
- Kismet (wireless network detector)
- Cursor pointer location toggle
- Various deb packages from a backup location

Intended for archival/system restore workflows.  May need `~/Documents/packages/installfiles.txt` present.

## Usage

Run directly (bash shebang is present):  `./script.sh [args]`

## Notes

- These scripts are not actively maintained.  Review before using.
- `imgburn.sh` is a dumb wrapper around `dd`.  Consider using `ddrescue` or `wipr` for safer imaging.
- `installer.sh` is legacy; prefer package manager scripts for reproducibility.
