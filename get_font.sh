#!/usr/bin/python3

import requests
import sys

def get_font_files():
  url = sys.argv[1]
  file = sys.argv[2]
  print(f"Downloading file to '{file}'...")
  with requests.get(url, stream=True) as res:
    res.raise_for_status()
    with open(file, 'wb') as f:
      for chunk in res.iter_content(chunk_size=8192): 
        f.write(chunk)
  print(f"Finished downloading.")

get_font_files()
