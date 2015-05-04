#!/usr/bin/env python

from setuptools import setup

setup(
    name='Pyblog',
    version='0.1',
    description='Python blog for OpenShift hosting',
    author='Dmitry Cheva',
    author_email='dmitry.cheva@gmail.com',
    url='http://www.python.org/sigs/distutils-sig/',
    install_requires=[
        'Django<1.8',
        'django_jinja',
        'django_simple_captcha',
        'django_guardian',
    ],
)
