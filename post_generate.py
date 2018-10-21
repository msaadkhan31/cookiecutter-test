import shutil

def move_file(source, desti):

  shutil.move(source, desti)


def main():
    try:
        move_file("{{ cookiecutter.directory_name }}/Makefile","Makefile")
    except Exception as err:
        LOG.error('Something went wrong while moving the file', err, err.message)

if __name__ == '__main__':
    main()