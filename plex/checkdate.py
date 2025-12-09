#!/bin/env python3

import os, sys
from datetime import datetime, timedelta

plexdir = 'mnt/Plex/Media/'
destinations = ['Movies', 'TV Shows', 'Anime']

def list_dir(folder):

    global plexdir, destinations
    files = os.listdir(folder)

    for item in files:
        file_path = Path(folder) / file
        # Check if file is a file
        if Path(file_path).is_file():
            last mtime = datetime.fromtimestamp(file_path.stat().st_mtime)
            

