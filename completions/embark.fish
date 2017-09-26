set -l harbors (string join '' $HOME '/.config/fisherman/embark/harbors')
complete -c embark -e
complete -c embark -a '(ls $harbors)' -f
