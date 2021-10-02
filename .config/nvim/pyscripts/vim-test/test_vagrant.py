#!/usr/bin/python3
import unittest
from vagrant import pycmd_function


class TestVagrantConf(unittest.TestCase):
    def test_conf_success(self):
        pycmd = pycmd_function(".test_vim.conf", "python manage.py test")
        self.assertEqual(
            pycmd,
            'vagrant ssh --command "'
            "source /home/vagrant/.venv/bin/activate ;"
            'cd /vagrant/demo; python manage.py test"',
        )

    def test_without_vagrant_path(self):
        pycmd = pycmd_function(
            ".test_vim_without_vagrant_path.conf", "python manage.py test"
        )
        self.assertEqual(
            pycmd,
            'vagrant ssh --command "'
            "source /home/vagrant/.venv/bin/activate ;"
            ' python manage.py test"',
        )

    def test_without_venv_path(self):
        pycmd = pycmd_function(
            ".test_vim_without_venv_path.conf", "python manage.py test"
        )
        self.assertEqual(
            pycmd,
            'vagrant ssh --command "' 'cd /vagrant/demo; python manage.py test"',
        )

    def test_without_one_var(self):
        pycmd = pycmd_function(
            ".test_vim_without_one_var.conf", "python manage.py test"
        )
        self.assertEqual(
            pycmd,
            "Error - One var doesn't exist in .vim.conf",
        )

    def test_not_exist_file(self):
        pycmd = pycmd_function(".test_vim_not_exist_file.conf", "python manage.py test")
        self.assertEqual(
            pycmd,
            "Error - Bad file or vim-test doesn't exist in .vim.conf",
        )


if __name__ == "__main__":
    unittest.main()
