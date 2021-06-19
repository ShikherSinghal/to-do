"""
Development Django Config to be used while development on local machine.
The path to this config file is mentioned in manage.py
"""

from .common import *
try:
    from .local import *
except:
    pass
