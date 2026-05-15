#!/usr/bin/env bash
set -euo pipefail

if [[ ${EUID} -ne 0 ]]; then
  echo "Please run as root: sudo bash $0"
  exit 1
fi

ts="$(date +%Y%m%d-%H%M%S)"

backup_file() {
  local f="$1"
  if [[ -f "$f" ]]; then
    cp "$f" "${f}.bak.${ts}"
    echo "Backed up: ${f}.bak.${ts}"
  else
    echo "Missing file: $f"
    exit 1
  fi
}

insert_fprint_line() {
  local f="$1"
  local line='auth      sufficient pam_fprintd.so'

  # Remove old entries first to avoid duplicates
  sed -i '/pam_fprintd\.so/d' "$f"

  # Insert before the auth include system-login line
  if grep -qE '^auth[[:space:]]+include[[:space:]]+system-login' "$f"; then
    sed -i '/^auth[[:space:]]\+include[[:space:]]\+system-login/i auth      sufficient pam_fprintd.so' "$f"
  else
    # fallback: prepend to file if expected include line is missing
    tmp="$(mktemp)"
    {
      echo "$line"
      cat "$f"
    } > "$tmp"
    cat "$tmp" > "$f"
    rm -f "$tmp"
  fi

  echo "Updated: $f"
}

echo "==> Backing up PAM files"
backup_file /etc/pam.d/system-local-login
backup_file /etc/pam.d/sddm

echo "==> Patching PAM files"
insert_fprint_line /etc/pam.d/system-local-login
insert_fprint_line /etc/pam.d/sddm

echo "==> Verifying"
grep -n 'pam_fprintd.so' /etc/pam.d/system-local-login /etc/pam.d/sddm

echo
echo "Done. Next:"
echo "1) Verify fingerprint enrollment: fprintd-list \$SUDO_USER"
echo "2) Lock screen and test fingerprint unlock"
echo "3) Confirm password fallback still works"
