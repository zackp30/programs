#!/usr/bin/python
# Copyright 2013 Zack Piper

import MySQLdb as mdb
import sys
import curses

panels = curses.initscr()
try:
    connection = mdb.connect('localhost', 'testuser', 'yeshellotestuser', 'testdb')
    with connection:
        cursor = connection.cursor()
        cursor.execute("select * from dvds")
        rows = cursor.fetchall()
        for row in rows:
            panels.addstr(0, 0, row)
except mdb.Error, error:
        print "Error %a %b" % (error.args[0], error.args[1])
finally:
    if connection:
        connection.close()

panels.border(0)
panels.addstr(12, 25, "Hai!")
panels.refresh()
panels.getch()
curses.endwin()
