# .zshrc
fpath=(/usr/local/share/zsh-completions $fpath)

# User specific aliases and functions
function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

function last_exit_code {
    echo $?
}

PROMPT='%F{cyan}%n%f %~ %F{green}`parse_git_branch`%f
$ '
RPROMPT='`last_exit_code`'
setopt prompt_subst #表示毎にPROMPTで設定されている文字列を評価する
