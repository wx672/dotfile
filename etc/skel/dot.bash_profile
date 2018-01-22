#!/bin/bash

umask 022

[ -f /usr/local/bin/home-setup.sh ] && /bin/bash /usr/local/bin/home-setup.sh
