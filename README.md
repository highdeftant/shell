# Bash Scripts

This is a mixture of scripts I've written - some for Debian, some for Arch
> Warning! A lot of these programs are possibly deprecated. Use at own risk.

**backupOS**:
    - Uses rsync to make a mirror image of $USER folder, this copies only the differences and will delete anything that gets deleted, keeping everything

****

**VPNSW** :
    - Switches between London and Washington, DC locations using the PIA CLI
> This doesn't work as it doesn't effectively check the current set location. I also don't use PIA VPN service anymore.
****

**Installer**:
    - An Ubuntu based script to restore all packages/configurations after an OS Install
	- Makes it way easier to resume where I left off if I have a critical system error that hinders computer performance.
	
****

**BGRotater**:
	- Changes the background on your PC via terminal using a folder full of pictures vs GUI
	- Its randomized so it always gives you a surprise background different from the last (may repeat bg at times).
    - This script only works on Debian/Ubuntu based Distributions.
****

**Argcnt**:
    - You can just feed this thing arguments and it'll keep count and print them out, useful for future scripts if you forget how
