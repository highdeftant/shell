# Archived unsafe or broken scripts

These files are retained for reference only. They are not supported or executable; do not run them without a deliberate review and repair.

- `imgburn.sh`, `iso_dd.sh`: write to block devices with incomplete argument, target, and confirmation checks.
- `extbackup.sh`: deletes local caches and uses `rsync --delete` without robustly validating the mounted destination.
- `installer.sh`: performs broad system changes using obsolete Ubuntu Hirsute/`apt-key` setup.
- `deauth.sh`: disrupts wireless networking and has no reliable restoration path.
- `organizer.sh`: moves files automatically; its extension and hidden-file handling are incorrect.
- `permis_check.sh`: fails Bash syntax checking and reads `/etc/shadow`; the generated audit logs have been removed.

The archived scripts have had their executable bit removed. The generated account-audit logs and hardcoded home path were removed from public history; the personal author email was replaced with the GitHub noreply address.
