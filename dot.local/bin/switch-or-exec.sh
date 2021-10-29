#!/bin/bash
# switch-or-exec - swith to open window or launch new instance of a program.
# License: GPLv2+
# Author: Volodymyr M. Lisivka <vlisivka@gmail.com>

set -ue

. import.sh log arguments

WINDOW_CLASS=""
STARTUP_COMMAND=""

# Return ID of active window in hexadecimal form without leading zeroes after 0x (e.g. 0x30000d4 )
activeWindowId() {
  xprop -root _NET_ACTIVE_WINDOW | cut -d '#' -f 2 | sed 's/ //g; s/0x0*/0x/; '
}

# Return class of given window (e.g. gedit.Gedit )
windowClass() {
  WINDOW_ID="$1"

  xprop -id "$WINDOW_ID" WM_CLASS | cut -d '=' -f 2 | sed 's/", "/./; s/[" ]//g;'
}

# Main function
main() {

  # Get ID and class of active window
  ACTIVE_WINDOW_ID=$( activeWindowId )
  ACTIVE_WINDOW_CLASS=$( windowClass "$ACTIVE_WINDOW_ID" )

  # If class of active window is not equal to class of target window
  if [ "$ACTIVE_WINDOW_CLASS" != "$WINDOW_CLASS" ]
  then
    # Just switch to first target window of given class (or execute command)
    wmctrl -xF -a "$WINDOW_CLASS" || $STARTUP_COMMAND "$@" </dev/null >/dev/null 2>&1 &
  else
    # Program is already ran and one of it windows is active.
    # Try to find more open windows of same class and switch to next available (or do nothing).

    # For all windows
    wmctrl -lx | (
      # Iterate over windows and find ID's of first window and next window of given class

      FIRST_WINDOW_ID=''
      NEXT_WINDOW_ID='not found'

      while read ID DESKTOP CLASS HOST TITLE
      do
        # Skip windows with different class
        [ "$CLASS" == "$WINDOW_CLASS" ] || continue

        [ -n "$FIRST_WINDOW_ID" ] || FIRST_WINDOW_ID="$ID"
        [ -n "$NEXT_WINDOW_ID" ] || NEXT_WINDOW_ID="$ID"

        # If ID of current window is *numerically* equal to active window ID,
        # then reset variable NEXT_WINDOW_ID to be set at next iteration
        if (( ID ==  ACTIVE_WINDOW_ID ))
        then
          NEXT_WINDOW_ID=''
        fi
      done

      # Activate next window or first findow, if next window is not found
      if [ "$NEXT_WINDOW_ID" != 'not found' -a -n "$NEXT_WINDOW_ID" ]
      then
        wmctrl -ia "$NEXT_WINDOW_ID" || :
      elif [ -n "$FIRST_WINDOW_ID" ]
      then
        wmctrl -ia "$FIRST_WINDOW_ID" || :
      fi
    )
  fi
}

parse_arguments "-w|--window-class)WINDOW_CLASS;S" "-c|--command)STARTUP_COMMAND;S" -- "${@}" || exit $?

which wmctrl >/dev/null || {
  error "wmctrl tool is required for this script."
  exit 1
}


[ -n "$STARTUP_COMMAND" ] || {
  error "Startup command is required for this script."
  exit 1
}

# Generate window class, if not filled
[ -n "$WINDOW_CLASS" ] || {
  # Strip options, if any
  FIRST_WORD_OF_COMMAND="${STARTUP_COMMAND%% *}"

  # Generate window class from command. Example:
  # COMMAND: gnome-terminal
  # WINDOW_CLASS: gnome-terminal.Gnome-terminal
  WINDOW_CLASS="$FIRST_WORD_OF_COMMAND.${FIRST_WORD_OF_COMMAND[@]^}"
}

main "${ARGUMENTS[@]:+${ARGUMENTS[@]}}"

exit $?
__END__

=pod

=head1 NAME

switch-or-exec - switch to/between open window or launch new instance of program.

=head1 SYNOPSIS

switch-or-exec [OPTIONS] [-- COMMAND_ARGUMENTS]

=head1 OPTIONS

=over 4

=item B<--help> | B<-h>

Print a brief help message and exit.

=item B<--man>

Show manual page.

=item B<-w> | B<--window-class> WINDOW_CLASS

Window class to switch to.

B<Hint:> use command C<wmctrl -lx> to list windows with their classes.

If not given, then value of command option will be used to generate
window class ( "cmd" -> "cmd.Cmd" ).

Examples:

  gnome-terminal.Gnome-terminal
  Navigator.Firefox

=item B<-c> | B<--command>  STARTUP_COMMAND

Command to run when window with given class is not found. Options are
allowed.

Required field. Use "/bin/true" for no operation.

=back

Unlike many other programs, this program stops option parsing at first
non-option argument.

Use -- in commandline arguments to strictly separate options and arguments.

All arguments are passed to command, when it is run.

=head1 DESCRIPTION

This script tries to switch to first or next window of already running program,
using window class, or launch new instance of program in background,
when no open windows are found.

Examples:

  # Try to switch to window with class "gedit.Gedit"
  # or execute command "gedit --encoding=utf-8" in the background
  switch-or-exec -c gedit -- --encoding=utf-8
  
  # Try to switch to window with class "Navigator.Firefox"
  # or execute command "firefox" in the background
  switch-or-exec -w Navigator.Firefox -c firefox
  
  # gnome-Terminal
  switch-or-exec -c gnome-terminal
  
  # eClipse
  switch-or-exec -w Eclipse.Eclipse -c eclipse
  
  # libre office Writer
  switch-or-exec -w libreoffice.libreoffice-writer -c libreoffice -- --writer

=head1 SEE ALSO

wmctrl(1)

toggle-or-exec / jump-or-exec in Sawfish.

=head1 AUTHOUR

Volodymyr M. Lisivka <vlisivka@gmail.com>

=cut
