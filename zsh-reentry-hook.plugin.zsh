#!/usr/bin/env zsh
# Plugin that re-enters working directory
# if it has been removed and re-created.
# http://github.com/RobSis/zsh-reentry-hook

[[ -o interactive ]] || return #interactive only
autoload -Uz add-zsh-hook || { print "can't add zsh hook!"; return }

reentry_hook() {
    if [[ `stat -c "%h" .` -eq 0 && -d "$PWD" ]]; then
        builtin cd ~/ && builtin cd "$OLDPWD"
    fi
}

add-zsh-hook preexec reentry_hook
