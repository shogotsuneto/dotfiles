# .bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if [ -f ~/.bash_aliases ]; then
    # for user-specific aliases and functions
    . ~/.bash_aliases
fi

if [ -f ~/.bash_paths ]; then
    . ~/.bash_paths
fi

# User specific aliases and functions
function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
export PS1='\[\e[1;32m\]\u@\h \[\033[0;33m\]\w\[\033[1;36m\]$(parse_git_branch)\[\033[0m\]\n$ '

