#!/usr/bin/env fish

##### SYSTEM SETTINGS

ulimit -n 4096
ulimit -u 4096
set -U EDITOR emacs
set -x DEFAULT_USER $USER

##### FUNDLE

if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end
fundle plugin 'edc/bass'
fundle plugin 'tuvistavie/fish-fastdir'
fundle plugin 'tuvistavie/fish-ssh-agent'
fundle plugin 'arzig/nvm-fish'
fundle plugin 'hauleth/agnoster'
fundle init

##### PATH

# 1. language managers
set -x PATH $HOME/code/pyenv/shims $HOME/code/pyenv/bin $HOME/.rvm/bin
# 2. user-specific bins
set -x PATH $PATH $HOME/.local/bin $HOME/bin
# 3. language-generated bins
set -x PATH $PATH /usr/local/go/bin $HOME/code/golang/bin $HOME/.cargo/bin $HOME/.rvm/gems
# 4. system default PATH members
set -x PATH $PATH /usr/local/sbin /usr/local/bin /usr/bin /bin /usr/local/games /usr/games

##### ABBREVIATIONS

set -U fish_user_abbreviations

abbr --add reload! 'exec fish'
abbr --add l 'ls -lAh'
abbr --add e 'echo'
abbr --add gco 'git checkout'
abbr --add ga 'git add'
abbr --add gl 'git pull'
abbr --add glr 'git pull --rebase'
abbr --add glog "git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
abbr --add gp 'git push'
abbr --add gc 'git commit'
abbr --add gd 'git diff'
abbr --add gs 'git status -sb'

switch (uname)
    case 'Linux'
        abbr --add c 'xclip -sel clip'
        abbr --add p 'xclip -o'
end

if type -q ag
    abbr --add agx 'ag -Q'
end

##### LANGUAGES

### Rust
set -x RUSTUP_DEFAULT_CHANNEL stable
switch (uname)
    case 'Linux'
        set -x RUSTUP_DEFAULT_HOST x86_64-unknown-linux-gnu
    case 'Darwin'
        set -x RUSTUP_DEFAULT_HOST x86_64-apple-darwin
end
if test -d "$HOME/.rustup/toolchains/$RUSTUP_DEFAULT_CHANNEL-$RUSTUP_DEFAULT_HOST/lib/rustlib/src/rust/src"
    set -x RUST_SRC_PATH "~/.rustup/toolchains/$RUSTUP_DEFAULT_CHANNEL-$RUSTUP_DEFAULT_HOST/lib/rustlib/src/rust/src/"
end

### Go
set -x GOPATH ~/code/golang

### Python
status --is-interactive; and . (pyenv init -|psub)

### Ansible
if type -q ansible
    set -x ANSIBLE_ROLES_PATH /etc/ansible/roles:~/.ansible/roles
end

### Ruby
rvm default

##### $JOB

# TODO
