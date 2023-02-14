import re
import os

home = os.environ["HOME"]

interpreter_path_re = re.compile(r'^{}/\.pyenv/versions/\d+\.\d+\.\d+/envs/(?P<env>[\w-]+)/bin/python$'.format(home))
site_pkg_path_re = re.compile(r'^({}/\.pyenv/versions/)(\d+\.\d+\.\d+)(/.*/site-packages)$'.format(home))


def Settings(**kwargs):
    client_data = kwargs['client_data']
    return {
        'interpreter_path': client_data['g:ycm_python_interpreter_path'],
        'sys_path': client_data['g:ycm_python_sys_path'],
        'flags': [ '-x', 'c++', '-Wall', '-Wextra', '-Werror' ]
    }


def PythonSysPath(**kwargs):
    venv = virtualenv(kwargs['interpreter_path'])
    sys_path = kwargs['sys_path']
    return add_env_path(sys_path, venv)


def virtualenv(interpreter_path):
    m = interpreter_path_re.match(interpreter_path)
    if m:
        return m.group('env')


def add_env_path(sys_paths, venv):
    if venv:
        repl = fr'\1{venv}\3'
        return [site_pkg_path_re.sub(repl, path) for path in sys_paths]
    return sys_paths

