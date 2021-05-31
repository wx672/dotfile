#!/bin/sh

# by Jakukyo Friel <weakish@gmail.com> (http://weakish.github.io)
# under MIT


if [ $# -eq 1 ]; then
window_name="$1"
else
	window_name="$2"
fi

wmctrl -x -a $window_name || ($1 &)

# TODO 1005797/runOrRaise.sh

