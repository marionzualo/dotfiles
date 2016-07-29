Manages TERMINFO files that add escape sequences for italic, and overwrite conflicting sequences for standout text.


To install run:
 tic -o ~/.terminfo ~/.dotfiles/terminfo/{{ file }}

To check that the terminal does the right thing:
 echo `tput sitm`italics`tput ritm` `tput smso`standout`tput rmso`

