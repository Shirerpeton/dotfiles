#!/usr/bin/bash

if [[ $# -eq 1 ]] || [[ $# -eq 2 ]]; then
    dir=$1
else
    dir=$(find ~/ ~/projects ~/projects/ts ~/projects/c -mindepth 1 -maxdepth 1 -type d | fzf)
fi


if [[ $# -eq 2 ]]; then
    name=$2
else
    name=$(basename "$dir" | tr . _)
fi

if [[ -z dir ]]; then
    exit 0
fi

tmux_pid=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_pid ]]; then
    tmux new-session -s $name -c $dir
    exit 0
fi


if ! tmux has-session -t=$name 2> /dev/null; then
    tmux new-session -ds $name -c $dir
fi

if [[ -n $TMUX ]]; then
    tmux switch -t $name
else
    tmux attach-session -t $name
fi

