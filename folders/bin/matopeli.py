#!/usr/bin/env python3

import curses
import _curses
import random
from collections import deque
from curses import wrapper

def main(win):
    win.clear()
    win.refresh()
    win.timeout(33)
    x, y = 100, 10
    xv, yv = 1, 0
    length = 5
    queue = deque()
    spawn_apple(win)

    while True:
        try:
            while True:
                key = win.getch()
                104, 106, 107, 108
                if key == curses.ERR:
                    break
                elif key in (curses.KEY_UP, ord('k')):
                    yv, xv = -1, 0
                elif key in (curses.KEY_DOWN, ord('j')):
                    yv, xv = 1, 0
                elif key in (curses.KEY_LEFT, ord('h')):
                    yv, xv = 0, -1
                elif key in (curses.KEY_RIGHT, ord('l')):
                    yv, xv = 0, 1
                elif 32 <= key <= 127:
                    win.addstr(0, 0, f"Unknown key {chr(key)} ")
                else:
                    win.addstr(0, 0, f"Unknown key {key}    ")
        except _curses.error:
            pass
        x += xv
        y += yv
        cur = win.inch(y, x)
        if cur == 64:
            return "You lose!"
        elif cur == 42:
            length += 1
            spawn_apple(win)
        queue.append((y, x))
        try:
            for pos in queue:
                addch(win, pos, "@")
            if len(queue) > length:
                addch(win, queue.popleft(), " ")
        except _curses.error:
            return "You lose!"
        win.move(y, x)

def spawn_apple(win):
    while True:
        y, x = random.choice(range(20)), random.choice(range(100))
        cur = win.inch(y, x)
        if cur == 32:
            break
    addch(win, (y, x), "*")

def addch(win, pos, ch):
        y, x = pos
        win.addch(y, x, ch)

def getch(win, pos):
        y, x = pos
        win.getch(y, x, ch)

print(wrapper(main))
