import os
import sys
import time
import glob

# from gif_for_cli.execute import execute
# environ = os.environ
# environ['COLORTERM'] = '256'

# execute(environ, ["gen_one.mp4"], sys.stdout)

# file_list = sorted(glob.glob('256/*'))
# file_list = [open(f).read() for f in file_list]

file_list = open("../00_TESTBED/frames.txt").read().split('|')[:-1]
ANSI_RESET = u'\u001b[0m'
ANSI_CURSOR_UP = u'\u001b[A'

def display_txt_frames(txt_frames, fps = 9):
    seconds_per_frame = 1. / fps
    previous_line_count = 0
    try:
        for txt_frame in txt_frames:
            sys.stdout.write(ANSI_CURSOR_UP * previous_line_count)
            sys.stdout.write(txt_frame)
            sys.stdout.write('\n')
            sys.stdout.flush()
            previous_line_count = len(txt_frames[0].split('\n'))
            time.sleep(seconds_per_frame)
        sys.stdout.write(ANSI_RESET)
        sys.stdout.write('\n')
    except KeyboardInterrupt:
        sys.stdout.write(ANSI_RESET)
        sys.stdout.write('\n')

display_txt_frames(file_list)
