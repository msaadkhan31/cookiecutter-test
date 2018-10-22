import logging
import shutil
import os

DockerEnv = '{{ cookiecutter.dockerenv }}'


def main():
    try:
        if DockerEnv == 'yes':
            inplace_change("Makefile", "upload-eb-version", "create-push-docker-image")
        move_file("Makefile", "../Makefile")
    except ImportError:
        logging.debug("Unable to copy file")


def move_file(source, desti):
  shutil.move(source, desti)


def inplace_change(filename, old_string, new_string):
    # Safely read the input filename using 'with'
    with open(filename) as f:
        s = f.read()
        if old_string not in s:
            return

    # Safely write the changed content, if found in the file
    with open(filename, 'w') as f:
        s = s.replace(old_string, new_string)
        f.write(s)


if __name__ == '__main__':
    main()