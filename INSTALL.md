#Clone into new dev project#
    $ sudo -i -u postgres
    postgres$ createdb milky
    $ cd /var/www
    $ git clone https://cheva@bitbucket.org/cheva/django-milky.git ./milky
    $ cd milky
    $ . venv/bin/activate
    $ pip install django
    $ pip install psycopg2
    $ ./app/manage.py migrate
    $ sudo ./app/manage.py runserver 0.0.0.0:8000 &

#How it was created#
1. (env) VirtualEnv с Python 2.7(!) на примере http://debian-help.ru/articles/ustanovka-flask-i-python-33-v-debian-7
Python 3 не подходит из-за несоответствия многих зависимосей.
Source: psycopg2
Version: 2.4.5-1build5
Provides: python3.4-psycopg2
Depends: python3 (>= 3.4~), python3 (<< 3.5), libc6 (>= 2.4), libpq5 (>= 8.3~))
2. (dev) Django и Postgres из учебника http://djbook.ru/rel1.7/topics/install.html - за исключением того, что уже стоит
3. (server) uWSGI и nginx на примере http://debian-help.ru/web-servers/zapusk-prilozheniya-na-flask-s-pomoschyu-uwsgi-nginx

##1. Python 2.7:##
    $ python -V
    Python 2.7.6

###VENV:###
    $ cd ~/Downloads
    $ sudo apt-get install curl
    $ sudo pip install https://github.com/pypa/virtualenv/tarball/develop
    $ wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py -O - | python
    $ wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py
    $ cd /var/www/myapp
    $ sudo pip install virtualenv
    $ virtualenv venv
    $ . venv/bin/activate

##2. DJANGO:##
    $ pip install django
    $ which django-admin.py
    $ django-admin.py startproject app

###POSTGRESQL###
    $ sudo apt-get install postgresql-server-dev-all
    $ sudo pip install psycopg2
    $ sudo -i -u postgres
    postgres$ubuntu:~$ createdb milky
    postgres$ubuntu:~$ psql -d postgres
    postgres=# \conninfo
    You are connected to database "postgres" as user "postgres" via socket in "/var/run/postgresql" at port "5432".
    ^d
    $ exit
