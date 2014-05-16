import argparse
from subprocess import call

parser = argparse.ArgumentParser()
parser.add_argument("-n", "--type", action="count")
parser.add_argument("-c", "--colour")
args = parser.parse_args()



def noncolour():
    if args.type == 1:
        call(["ls", "-l"])
    elif args.type == 2:
        call(["ls", "-la"])
    else:
        call(["ls"])

def colour():
    if args.type == 1:
        call(["ls", "-l", "--color"])
    elif args.type == 2:
        call(["ls", "-la", "--color"])
    else:
        call(["ls", "--color"])

if args.colour == "1":
    colour()
else:
    noncolour()
