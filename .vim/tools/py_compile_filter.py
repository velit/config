#!/usr/bin/env python

import sys
import re

for line in sys.stdin.readlines():
	print re.sub(r"([\w]*?:) \('(.*?)', \('(.*?)', (\w*), (\w*), '([^']*)'\)\)", "\\1 \\2, \\3, \\4, \\5", line, 1)
