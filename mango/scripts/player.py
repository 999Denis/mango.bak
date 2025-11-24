#!/usr/bin/env python3
import subprocess
import json

def get_current_track_and_status():
    try:
        title_result = subprocess.run(
            ['playerctl', '--player=Feishin', 'metadata', 'title'],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        title = title_result.stdout.strip() if title_result.returncode == 0 else None

        status_result = subprocess.run(
            ['playerctl', '--player=Feishin', 'status'],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        status = status_result.stdout.strip().lower() if status_result.returncode == 0 else None

        return title, status
    except FileNotFoundError:
        return None, None

def main():
    title, status = get_current_track_and_status()

    # Nerd Fonts icons per play e pausa (Font usato deve essere Nerd Font)
    icon_play = "\uf04b"   #  (fa-play)
    icon_pause = "\uf04c"  #  (fa-pause)

    if title:
        icon = icon_pause if status == "playing" else icon_play
        output = {"text": f"{title}    {icon}"}
    else:
        output = {"text": ""}

    print(json.dumps(output))

if __name__ == '__main__':
    main()
