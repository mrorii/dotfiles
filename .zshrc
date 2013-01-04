export CLICOLOR=1

# keybind
bindkey -e  # emacs-style keybind
bindkey '^P' history-beginning-search-backward 
bindkey '^N' history-beginning-search-forward 

# coloring
autoload -Uz colors
colors

# autocompletion
autoload -U compinit
compinit

# move around completion in emacs-keybind
zstyle ':completion:*:default' menu select=1

# do not discriminate between large/small caps when completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# display completion list with colors
zstyle ':completion:*' list-colors ''

# colors
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# history
HISTFILE="$HOME/.zhistory"      # history file
HISTSIZE=10000                  # 
SAVEHIST=10000                  # maximum number of commands saved

# when using multiple zsh at a time, do not overwrite but append to history
setopt append_history

# if command doesn't exist and matches directory, move into that directory
setopt auto_cd

# display completion list if multiple completion exists
setopt auto_list

# be able to use Tab to move through completions
setopt auto_menu

# automatically complete matching  paranthesis
setopt auto_param_keys

# complete / at end of directory name
setopt auto_param_slash

# automatically remove slash at end of directory name
setopt auto_remove_slash

# resume suspended process with the same name
setopt auto_resume

# do not let beeps sound
setopt NO_beep

# allow {a-c} to be expanded to a b c
setopt brace_ccl

# spellcheck command name
setopt correct

# use  #, ~, ^ as regex in filenames
setopt extended_glob

# don't use Ctrl+S/Ctrl+Q as control flow
setopt NO_flow_control

# ignore immediate history duplicates
setopt hist_ignore_dups

# if command starts with space, don't save it in history
setopt hist_ignore_space

# don't exit with Ctrl-D
# setopt ignore_eof

# let # as comment even in command line
setopt interactive_comments

# complete commandline arguments after = (i.e. --prefix=/usr)
setopt magic_equal_subst

# append / to end of filename when it is a directory
setopt mark_dirs

# when there are multiple completion candidates,
# don't auto_list and complete with first candidate
setopt menu_complete

# multiple redirects, pipes
setopt multios

# use numerical orders for filename expansions
setopt numeric_glob_sort

# perform a path search even on command names with slashes in them.
# setopt path_dirs

# print eight bit characters literally in completion lists, etc. 
setopt print_eightbit

# print the exit value of programs with non-zero exit status.
setopt print_exit_value

# don’t push multiple copies of the same directory onto the directory stack.
setopt pushd_ignore_dups

# have pushd with no arguments act like ‘pushd $HOME’.
# setopt pushd_to_home

# do not query the user before executing ‘rm *’ or ‘rm path/*’.
# setopt rm_star_silent

# if querying the user before executing ‘rm *’ or ‘rm path/*’, first wait ten seconds and ignore anything typed in that time.
setopt rm_star_wait

# allow the short forms of for, repeat, select, if, and function constructs.
setopt short_loops

# use single-line command line editing instead of multi-line.
# setopt single_line_zle

# print commands and their arguments as they are executed.
# setopt xtrace

# Use colors
setopt prompt_subst

# Share histories for different shell processes
setopt share_history

# Remove history (fc -l) command from history
setopt hist_no_store

# prevent the prompt overwriting output when there is no newline?
unsetopt promptcr

# When copy-and-pasting, don't display rprompt
#setopt transient_rprompt

# cd -[tab] for pushd
#setopt autopushd

# Complete alias
setopt complete_aliases

export EDITOR=vi

# Read local settings
[ -f ~/.zshrc.local ] && source ~/.zshrc.local


