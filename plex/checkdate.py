#!/bin/env python3

import os, sys
from datetime import datetime, timedelta

plexdir = 'mnt/Plex/Media/'
destinations = ['Movies', 'TV Shows', 'Anime']

def list_dir(folder):
    num = 0
    files = os.listdir(folder)

    for item in files:
        if os.path.isfile(item):
            num += 1
            return item


list_dir(sys.argv[1])
