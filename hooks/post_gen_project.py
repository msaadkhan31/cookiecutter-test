import logging
import shutil
import os
def move_file(source, desti):

  shutil.move(source, desti)


def main():
    try:
        move_file("Makefile","../Makefile")
    except ImportError:
        logging.debug("Unable to copy file")


if __name__ == '__main__':
    main()