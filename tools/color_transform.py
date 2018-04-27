from x256 import x256
import sys
import argparse

def print_color(color, text, color_text=False):
    modifier = '\x1b[38;5;' if color_text else '\x1b[48;5;'
    print(modifier + str(color) + 'm' + str(text) + '\033[0m')

def print_in_color(xterm_color, text):
    print('\x1b[38;5;' + str(xterm_color) + 'm' + str(text))

def print_backround_in_color(xterm_color, text):
    print('\x1b[48;5;' + str(xterm_color) + 'm' + str(text))

def all_colors():
    for i in range(256):
        print_in_color(i, i)

def xterm2rgb(xterm, color_text):
    """ Convert xterm-256 to RGB via lookup table
    """
    rgb = x256.to_hex(int(xterm))
    text = 'xterm color {} -> RGB exact {}'.format(xterm, rgb)
    print_color(xterm, text, color_text=color_text)

def rgb2xterm(rgb, color_text):
    rgb = rgb.lstrip('#')
    color = x256.from_hex(rgb)
    text = 'RGB {} -> xterm color {}'.format(rgb, color)
    print_color(color, text, color_text=color_text)

def process(arg, color_text):
    [xterm2rgb(i, color_text) if _is_xterm(i) else rgb2xterm(i, color_text) for i in arg]

def _is_xterm(xterm):
    return len(xterm) <= 3 and int(xterm) <= 255

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('colors', nargs=argparse.REMAINDER, help='the color(s) to be transformed')
    parser.add_argument('-t', '--text', action='store_true', help='specify if the text is colored')
    parser.add_argument('-a', '--all', help='print all colors')
    args = parser.parse_args()

    if args.all: all_colors()
    else: process(args.colors, args.text)
