[ ! "$ARTOOLS_NOPROMPTMUNGE" == "1" ] && [ -z "$PS1" ] && return

compile_prompt() {
   shopt -s histappend                            # Add history from all the terminal opened
   shopt -s checkwinsize                          # Keep checking terminal size
   if [ $BASH_VERSINFO -ge 4 ]; then
     shopt -s globstar                            # ** enabled
     shopt -s autocd                              # Type the directory name and cd it
   fi
   stty -ixon                                     # Set forward searching

   # File loading (Order matters) :ARCANE:
   for file in `cat <&10`; do
     [ -f ~/.bash_${file} ] && . ~/.bash_${file}
   done 10<<< "exports aliases prompt functions independent"


   # Git configuration
   if [[ -z "$(git config --get user.name)" || -z "$(git config --get user.email)" ]]; then
     git config -f ~/.gitconfig.local user.name "$GIT_AUTHOR_NAME"
     git config -f ~/.gitconfig.local user.email "$GIT_AUTHOR_EMAIL"
   fi
}

if [ -z ${ARTOOLS_NOPROMPTMUNGE} ]; then
   PROMPT_COMMAND='compile_prompt'      
fi


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/olzhas/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/olzhas/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/olzhas/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/olzhas/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/olzhas/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/olzhas/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

export PATH="$PATH:$HOME/.local/bin"
export PATH=$PATH:/home/olzhas/terraform
export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:$(go env GOPATH)/bin"


# The next line updates PATH for CLI.
if [ -f '/home/olzhas/yandex-cloud/path.bash.inc' ]; then source '/home/olzhas/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/home/olzhas/yandex-cloud/completion.bash.inc' ]; then source '/home/olzhas/yandex-cloud/completion.bash.inc'; fi

source /usr/share/bash-completion/completions/git

# pnpm
export PNPM_HOME="/home/olzhas/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
source <(kubectl completion bash)

# krew path
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
