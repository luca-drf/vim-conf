import re


interpreter_path_re = re.compile(r'^/Users/ldrf/\.pyenv/versions/\d+\.\d+\.\d+/envs/(?P<env>[\w-]+)/bin/python$')
site_pkg_path_re = re.compile(r'^(/Users/ldrf/\.pyenv/versions/)(\d+\.\d+\.\d+)(/.*/site-packages)$')


def Settings(**kwargs):
    client_data = kwargs['client_data']
    return {
        'interpreter_path': client_data['g:ycm_python_interpreter_path'],
        'sys_path': client_data['g:ycm_python_sys_path']
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

