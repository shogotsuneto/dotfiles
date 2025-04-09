# .zshrc
autoload -U add-zsh-hook

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

function nvmrc_use {
    if [ -f .nvmrc ]; then
        nvm use
    # else
    # commented out because didn't want to switch back to default if its child dir
    #     if [ "$(nvm version current)" != "$(nvm version default)" ]; then
    #         nvm use default
    #     fi
    fi
}

PROMPT='%F{cyan}%n%f %~ %F{green}`parse_git_branch`%f
$ '
RPROMPT='`last_exit_code`'
setopt prompt_subst #表示毎にPROMPTで設定されている文字列を評価する

add-zsh-hook chpwd nvmrc_use
nvmrc_use
