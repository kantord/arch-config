source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
#antigen bundle heroku
antigen bundle pip
#antigen bundle lein
antigen bundle command-not-found
#antigen bundle desyncr/auto-ls
antigen bundle Vifon/deer
antigen bundle chrissicool/zsh-256color

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme https://github.com/sobolevn/sobole-zsh-theme
#antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship
antigen theme refined



# Tell Antigen that you're done.
antigen apply

autoload -U deer
zle -N deer
bindkey '\ek' deer


BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
