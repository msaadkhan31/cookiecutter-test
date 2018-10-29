import logging
import shutil
import os


def main():
    try:
        move_file("Makefile", "../Makefile")
    except ImportError:
        logging.debug("Unable to copy file")


def move_file(source, desti):
    shutil.move(source, desti)


if __name__ == '__main__':
    main()
