# Shell Scripts Collection

Archived shell scripts for system administration, media management, and development workflows.

> ⚠️ **Warning**: Some scripts are deprecated or incomplete; review before execution. Some use `sudo` without argument sanitization.

---

## Directory Structure

```
.
├── .gitignore
├── archive/
│   └── unsafe/              # Retired, non-executable prototypes
│       ├── README.md
│       ├── deauth.sh
│       ├── extbackup.sh
│       ├── imgburn.sh
│       ├── installer.sh
│       ├── iso_dd.sh
│       ├── organizer.sh
│       └── permis_check.sh
├── dotfiles/
│   └── fish_config/
│       └── tide_install.sh
├── fix-fingerprint-pam.sh
├── old_scripts/             # Legacy/unsupported examples; reference only
│   ├── argcnt.sh
│   ├── bgrotate.sh
│   ├── fldrmkr.sh
│   ├── for.sh
│   ├── save.sh
│   ├── updater.sh
│   └── vpnsw.sh
├── plex/
│   ├── aviconverter.sh
│   ├── checkdate.py
│   ├── plex_fileswitch.env.example
│   └── plex_fileswitch.sh
├── README.md
└── LICENSE
```

---

## Scripts by Category

### Archived high-risk tools

Disk imaging, backup, installer, file-organizer, account-audit, and wireless deauthentication prototypes are retained under `archive/unsafe/` as non-executable reference files. Their current forms are incomplete or dangerous; see `archive/unsafe/README.md` and do not run them without review and repair.

### System Maintenance

**`fix-fingerprint-pam.sh`** — Backs up and configures PAM for fingerprint authentication.
```bash
sudo ./fix-fingerprint-pam.sh
```
> Creates timestamped backups before patching `/etc/pam.d/system-local-login` and `/etc/pam.d/sddm`. Review the script and verify password fallback after running it.

**`old_scripts/updater.sh`** — Legacy, unsupported update wrapper retained for reference. Its package-manager assumptions may not match this system; do not run without reviewing it first.

### Plex Media Management

**`plex/plex_fileswitch.sh`** — Syncs one regular file to a Plex server over SSH with `rsync`.
```bash
mkdir -p ~/.config/plex
cp plex/plex_fileswitch.env.example ~/.config/plex/plex_fileswitch.env
chmod 600 ~/.config/plex/plex_fileswitch.env
$EDITOR ~/.config/plex/plex_fileswitch.env
./plex/plex_fileswitch.sh /path/to/movie.mp4
```
> Set `PLEX_DEST`, `PLEX_USER`, and `PLEX_HOST` in that private config file or the environment. Set `PLEX_FILESWITCH_CONFIG` to use a different config path. Never commit site-specific connection details.

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

### Legacy Utilities (unsupported)

The following `old_scripts/` examples are not maintained or safety-reviewed. They may fail on modern systems or assume obsolete platform-specific paths; treat them as historical references, not supported tools.

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

### Dotfiles

**dotfiles/fish_config/tide_install.sh** — Tide theme installer for Fish shell.
```bash
# ./dotfiles/fish_config/tide_install.sh
```
> Installs Tide prompt theme v6 from GitHub releases.

---

## Safety Notes

1. Scripts in `archive/unsafe/` are non-executable but remain dangerous if invoked manually; review and repair before use.
2. `fix-fingerprint-pam.sh` changes PAM configuration. It creates timestamped backups; verify password fallback after running it.
3. `plex/plex_fileswitch.sh` sources a local configuration file. Keep that file owner-readable only and never store it in Git.
4. The remaining `old_scripts/` tools are legacy and may assume obsolete platforms or paths.

---

## Cleanup Recommendations

- Review archived scripts before promoting or running them
- Add syntax, lint, and dry-run tests before reactivating any archived tool
- Keep machine-specific configuration and generated output outside Git

---

*Built by Ant.  Version 0.2.5 (macOS origins).*
