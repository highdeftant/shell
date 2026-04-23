# Bash Scripts Collection

Archived shell scripts for system administration, media management, and development workflows.

> ⚠️ **Warning**: Many scripts are deprecated, incomplete, or contain merge conflicts. Review before execution.  Some use `sudo` without argument sanitization.

---

## Directory Structure

```
.
├── administrative/          # User audit and permission checks
│   └── user_audit/          # Audit logs and scripts
├── dotfiles/                # Personal configuration (alacritty, vim, fish)
│   └── fish_config/         # Tide theme installer
├── file_organizer/          # Automated file sorting by type
├── iso_dd.sh                # ISO image writing tool
├── imgburn.sh               # USB burning via `dd` (DANGEROUS)
├── networking/              # Wireless monitoring tools
│   └── deauth.sh            # WiFi deauth/monitor mode
├── old_scripts/             # Legacy system scripts
│   ├── argcnt.sh           # Argument counter
│   ├── bgrotate.sh         # Wallpaper rotator
│   ├── extbackup.sh        # System backup to external drive
│   ├── fldrmkr.sh          # Web dev folder creator (macOS)
│   ├── installer.sh        # System restoration script
│   ├── save.sh             # Quick web scraper
│   ├── updater.sh          # `apt update/upgrade` wrapper
│   └── vpnsw.sh            # Private Internet Access VPN switcher
├── plex/                    # Plex media management
│   ├── aviconverter.sh     # AVI→MP4 converter via VLC
│   ├── checkdate.py        # File listing utility
│   └── plex_fileswitch.sh  # Plex media sync (has merge conflict)
├── README.md
└── LICENSE
```

---

## Scripts by Category

### ISO/USB Burning

**iso_dd.sh** — Lists ISO files and writes to USB drives.
```bash
# ./iso_dd.sh /path/to/ISOs/  # Lists ISOs, then prompts for selection
```
> Uses `dd` with 4MB block size.  Double-check device paths to avoid data loss.

**imgburn.sh** — Minimal ISO burner.
```bash
# ./imgburn.sh ubuntu.iso /dev/sdX
```
> DANGEROUS: Direct `dd` invocation without safety checks.  Use only for trusted media.

### System Maintenance

**old_scripts/updater.sh** — System update wrapper.
```bash
# ./old_scripts/updater.sh
```
> Runs `sudo apt update upgrade autoclean autoremove` in a loop.

**old_scripts/extbackup.sh** — Full system backup to external USB.
```bash
# ./old_scripts/extbackup.sh
```
> Archives `~` to `/mnt/media/$USER/backupdr/arch_backup/`.
> Clears browser caches before backup.  Requires mounted external drive.

### Plex Media Management

**plex/plex_fileswitch.sh** — Syncs local media to Plex server.
```bash
# ./plex/plex_fileswitch.sh /path/to/movie.mp4
```
> Uses `rsync` over SSH.  Has an unresolved merge conflict in current HEAD.

**plex/aviconverter.sh** — Batch video conversion.
```bash
# ./plex/aviconverter.sh
```
> Converts `*.avi` to `*.mp4` using VLC with H.264/MP4A encoding.
> Usage: `./aviconverter.sh /path/to/video/*.avi`

**plex/checkdate.py** — File listing utility.
```bash
# ./plex/checkdate.py /mnt/Plex/Media/Movies
```
> Simple Python script to count files in a Plex directory.

### Networking

**networking/deauth.sh** — WiFi monitoring and deauthentication.
```bash
# ./networking/deauth.sh
```
> Puts device in monitor mode, then enters interactive loop.
> `deauthNet` function sends 100 deauth packets to a MAC address (runs 30×).
> **Requires**: `aircrack-ng` suite and wireless interface (e.g., `wlan0`).

### File Organization

**file_organizer/organizer.sh** — Auto-sorts files by extension.
```bash
# ./file_organizer/organizer.sh /path/to/files/
```
> Moves old files (>30 days) to archive folders: `~/Archive/{Documents,Images,Scripts,etc}`.
> Skips hidden files.  Creates destination directories if missing.
> **Note**: Uses `stat -c "%Y"` (Linux) not `stat -f` (macOS).  macOS users need adjustment.

### User Administration

**administrative/user_audit/permis_check.sh** — System user audit.
```bash
# sudo ./administrative/user_audit/permis_check.sh
```
> Checks for active vs. inactive accounts, logs last login times.
> **Incomplete**: Missing variable declarations (`ACTIVE_USERS`, `INACTIVE_USERS` arrays never initialized).  Does not output full report.

### Quick Utilities

**old_scripts/argcnt.sh** — Counts and displays arguments.
```bash
# ./old_scripts/argcnt.sh arg1 arg2 arg3
# Output: "there are 3 arguments" then lists each
```

**old_scripts/save.sh** — Quick web scraper.
```bash
# ./old_scripts/save.sh https://example.com
```
> Extracts first image URL from page source, saves via `wget`.
> Relies on page HTML structure—fragile.

**old_scripts/bgrotate.sh** — GNOME wallpaper rotator.
```bash
# ./old_scripts/bgrotate.sh
```
> Picks random image from `~/Pictures/Wallpapers` and sets as GNOME background.
> Intended for cron: `* * * * * /path/to/bgrotate.sh`

**old_scripts/fldrmkr.sh** — Web dev folder creator.
```bash
# ./old_scripts/fldrmkr.sh
```
> macOS-only: Creates project folder with `index.html` and `resources/css/index.css`.
> Linux users will fail at `/Users/$USER/Dropbox/...` paths.

**old_scripts/installer.sh** — Legacy system setup.
```bash
# ./old_scripts/installer.sh
```
> Installs specific tools: Vundle.vim, GNOME helpers, Kismet, cursor pointer toggle.
> Reads from `~/Documents/packages/installfiles.txt` for deb packages.
> **Deprecated**: Prefer package manager scripts for reproducibility.

### Dotfiles

**dotfiles/fish_config/tide_install.sh** — Tide theme installer for Fish shell.
```bash
# ./dotfiles/fish_config/tide_install.sh
```
> Installs Tide prompt theme v6 from GitHub releases.

---

## Merge Conflicts & Incomplete Files

| File | Issue |
|------|-------|
| `plex/plex_fileswitch.sh` | Contains unresolved Git merge conflict markers (`<<<<<<< HEAD`) |
| `iso_dd.sh` | Incomplete logic—never actually calls `burnISO` function |
| `networking/deauth.sh` | Runs `while true` loop indefinitely; requires manual Ctrl+C |
| `administrative/user_audit/permis_check.sh` | Missing variable initialization; incomplete loop |

---

## Safety Notes

1. **`imgburn.sh` and `iso_dd.sh`** both use `dd` without safety checks.  Always verify `/dev/sdX` is your target drive.
2. **`networking/deauth.sh`** can interfere with neighboring WiFi networks.  Use responsibly.
3. **`file_organizer/organizer.sh`** moves files without confirmation—review the logic before running on critical data.
4. **`old_scripts/installer.sh`** assumes specific paths and dependencies; test on a VM first.

---

## Cleanup Recommendations

- Remove `old_scripts/` if these tools are no longer needed
- Fix or delete `plex/plex_fileswitch.sh` until merge conflict is resolved
- Archive `administrative/user_audit/` logs older than 30 days
- Consider rewriting `iso_dd.sh` with explicit `umask` and `blkid` validation

---

*Built by Ant.  Version 0.2.5 (macOS origins).*
