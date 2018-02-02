# CTRL-T - Paste the selected file path(s) into the command line
__fsel() {
    set -o nonomatch
    command find * \( -path '*/\.*' -o -name target \) -prune \
        -o -type f -print \
        -o -type d -print \
        -o -type l -print 2> /dev/null | fzf --multi | while read item; do
            printf '%q ' "$item"
        done
    echo
}

fzf-file-widget() {
    LBUFFER="${LBUFFER}$(__fsel)"
    zle redisplay
}
zle     -N   fzf-file-widget
bindkey '^T' fzf-file-widget

# ALT-C - cd into the selected directory
fzf-cd-widget() {
    cd "${$(set -o nonomatch; \
        command find * \( -path '*/\.*' -o -path '*/ivy/*.cache' -o -name target \) -prune -o -type d -print 2> /dev/null \
        | fzf):-.}"
    for func in $precmd_functions; do
        $func
    done
    zle reset-prompt
}
zle     -N    fzf-cd-widget
bindkey '\ec' fzf-cd-widget

# CTRL-R - Paste the selected command from history into the command line
if have fzf; then
    fzf-history-widget() {
        LBUFFER=$(fc -l 1 | fzf --exact --no-sort --nth=2.. --tac | sed "s/^ *[0-9*]* *//")
        zle redisplay
    }
    zle -N fzf-history-widget

    # allow nesting of C-R, from
    # http://chneukirchen.org/blog/archive/2013/03/10-fresh-zsh-tricks-you-may-not-know.html
    autoload -Uz narrow-to-region
    _history-incremental-preserving-pattern-search-backward() {
        NUMERIC=0 zle set-local-history
        local state
        MARK=CURSOR  # magick, else multiple ^R don't work
        narrow-to-region -p "$LBUFFER${BUFFER:+>>}" -P "${BUFFER:+<<}$RBUFFER" -S state
        zle end-of-history
        zle fzf-history-widget
        narrow-to-region -R state
    }
    zle -N _history-incremental-preserving-pattern-search-backward
    bindkey '^r' _history-incremental-preserving-pattern-search-backward
fi


RECENTDIRS_FILE="$ZSH_VAR_LIB_DIR/recent-dirs"
[[ ! -a $RECENTDIRS_FILE ]] && touch $RECENTDIRS_FILE
__recentdirs_add() {
    echo "$PWD" >>| "$RECENTDIRS_FILE"

    # remove duplicate directories except for the last occurrence
    local tmpfile=$(mktemp)
    trap "rm -f '$tmpfile'" EXIT INT QUIT
    tac "$RECENTDIRS_FILE" | awk '!x[$0]++' | tac | tail -n 200 >| "$tmpfile"
    if [[ $? -eq 0 ]]; then
        mv "$tmpfile" "$RECENTDIRS_FILE"
    fi
}
autoload -Uz add-zsh-hook
add-zsh-hook chpwd __recentdirs_add

j() {
    cd "$(cat "$RECENTDIRS_FILE" | fzf --exact)"
}

J() {
    cd "$(hash -d | sed -e 's/^.*=//' | fzf --exact)"
}

v() {
    local viminfo="$HOME/.var/lib/vim/viminfo"

    sed -r -n -e 's/^> //p'  ~/.var/lib/vim/viminfo | tac | while read line; do
        [[ -f "${line/\~/$HOME/}" ]] || continue
        [[ "${line//*\//}" == COMMIT_EDITMSG ]] && continue

        echo $line
    done | fzf
}

copy-pw() {
    lpass show --clip --password $(lpass ls | fzf | awk '{print $(NF)}' | sed 's/\]//g')
}

# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# vim: filetype=zsh
