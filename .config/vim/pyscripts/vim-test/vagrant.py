#!/usr/bin/python3
import sys
import configparser

"""This plugin help to vim-test with vagrant for django

Args:
    sys.argv[0] = Root fullpath called by nvim . that contains the file config
    sys.argv[1] = Vim test command sending by plugin vim-test

Returns:
    vagrant ssh --command "..."
"""


def pycmd_function(path_file_config, django_test_cmd):
    # Parse config file
    parser = configparser.ConfigParser()
    parser.read(path_file_config)

    try:
        str_cmd = ""
        # adding command to active virtualenv
        if parser.get("vim-test", "venv_path"):
            venv_path = "source %s/bin/activate " % parser.get("vim-test", "venv_path")
            str_cmd += venv_path + ";"

        # adding command go to vagrant path
        if parser.get("vim-test", "vagrant_path"):
            cd_path = "cd " + parser.get("vim-test", "vagrant_path")
            str_cmd += cd_path + ";"

        # command result that will catch by init.vim
        return f"vagrant ssh --command \"{str_cmd} {django_test_cmd}\""
        # return "vagrant"

    except configparser.NoOptionError:
        return "Error - One var doesn't exist in .vim.conf"

    except configparser.NoSectionError:
        return "Error - Bad file or vim-test doesn't exist in .vim.conf"


if __name__ == "__main__":
    pycmd = pycmd_function(sys.argv[0], sys.argv[1])
