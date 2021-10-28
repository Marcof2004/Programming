import os
os.system("pip install youtube_dl")
import youtube_dl
link = input("https://www.youtube.com/watch?v=sDj72zqZakE")
os.system(f"youtube_dl {link}")