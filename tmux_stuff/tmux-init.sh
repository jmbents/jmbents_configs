#!/bin/bash

# Include the following line in ~/.profile if there are errors using vim inside of tmux because of vim color
# export TERM=xterm

# Window 0
tmux rename-window alderaan
tmux split-window -h
tmux split-window

# Window 1
tmux new-window
tmux select-window -t 1
tmux rename-window tatooine
tmux split-window -h
tmux split-window

# Window 2
tmux new-window
tmux select-window -t 2
tmux rename-window hoth
tmux split-window -h

# Window 3
tmux new-window
tmux select-window -t 3
tmux rename-window mandelore

# Window 4
tmux new-window
tmux select-window -t 4
tmux rename-window kashyyyk

# Window 5
tmux new-window
tmux select-window -t 5
tmux rename-window jakku

# Window 6
tmux new-window
tmux select-window -t 6
tmux rename-window dagobah

# Window 7
tmux new-window
tmux select-window -t 7
tmux rename-window jedha

# Return to window 0
tmux select-window -t 0
