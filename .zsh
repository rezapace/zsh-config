# Pakcage: .zshrc
[[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] && source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[[ ! -d "$ZINIT_HOME" ]] && { echo "Installing Zinit..."; mkdir -p "$(dirname "$ZINIT_HOME")" && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME" && echo "Zinit installed successfully!" || { echo "Error: Failed to install Zinit"; return 1; }; }
[[ -f "${ZINIT_HOME}/zinit.zsh" ]] && source "${ZINIT_HOME}/zinit.zsh" || { echo "Error: Zinit not found at ${ZINIT_HOME}/zinit.zsh"; return 1; }
for plugin in romkatv/powerlevel10k zsh-users/zsh-syntax-highlighting zsh-users/zsh-completions zsh-users/zsh-autosuggestions marlonrichert/zsh-autocomplete rupa/z clvv/fasd wting/autojump trapd00r/LS_COLORS; do zinit load "$plugin"; done
for snippet in git sudo archlinux command-not-found; do zinit snippet OMZP::$snippet; done
autoload -Uz compinit && compinit && zinit cdreplay -q
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
bindkey -e && bindkey '^p' history-search-backward && bindkey '^n' history-search-forward && bindkey '^[w' kill-region
HISTSIZE=10000 && HISTFILE=~/.zsh_history && SAVEHIST=$HISTSIZE && HISTDUP=erase
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' && zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" && zstyle ':completion:*' menu select
command -v fzf >/dev/null && { [[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh; export FZF_DEFAULT_OPTS="--height 40% --layout=reverse"; command -v fd >/dev/null && { export FZF_DEFAULT_COMMAND='fd --type f'; export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"; }; }
zinit list | grep -q "fzf-tab" && { zstyle ':fzf-tab:*' fzf-flags '--height=40%'; zstyle ':fzf-tab:complete:*:*' fzf-preview '[[ -f $realpath ]] && head -20 $realpath || ls -la $realpath'; }
# -----------------------------------------------------------------------------------

# Directory navigation aliases (fixed paths)
alias h='cd ~'
alias v='code .'
alias c='clear'
alias hapus='rm -rf'
alias home='cd /home/reza'
alias profile='code ~/.zshrc'
alias rprofile='source ~/.zshrc'

# Directory listing and management aliases
alias ls='command -v exa >/dev/null && exa --color=auto --group-directories-first --git || ls --color=auto --group-directories-first'
alias ll='command -v exa >/dev/null && exa -alF --color=always --group-directories-first --icons --git --header || ls -alF --color=always'
alias tree='command -v exa >/dev/null && exa --tree --level=3 --color=always --group-directories-first --icons --git || tree -C'

# File and directory permissions aliases
alias mx='chmod a+x'
alias mod='chmod +x ./*'

#SERVER-ALIAS-BY-WORKSPACE
alias code='code-server'

# GitHub push with auto-branch detection
gupp() { [[ -z "$1" ]] && echo "Usage: gupp \"commit message\"" && return 1; git add . && git commit -m "$1" && git push -u origin "$(git rev-parse --abbrev-ref HEAD)"; }

# Create a GitHub release with the current date and time
grel() { local z="release-$(date +%Y%m%d%H%M%S).zip" w="$HOME/workspace" t=$(gh release list -L1 --json tagName -q '.[0].tagName' 2>/dev/null) v=${t#v} n; [[ ! -d "$w" ]] && echo "❌ $w not found" && return 1; IFS='.' read -r maj min pat <<< "${v:-0.0.0}"; ((pat<9?pat++:(pat=0,min++))); n="v$maj.$min.$pat"; zip -rq "$z" "$w" && gh release create "$n" "$z" -t "$n" -n "Auto release $n" && echo "✅ $n released with $z" || echo "❌ Failed"; }

# Create directory and navigate into it
mkdirg() { [[ -n "$1" ]] && mkdir -p "$1" && cd "$1" || { echo "Usage: mkdirg <directory_name>"; return 1; }; }

# Copy file to destination directory with auto-rename and navigation
cpg() { local src=$1 dest=$2; [[ -z "$src" || -z "$dest" ]] && { echo "Usage: cpg <source> <destination>"; return 1; }; cp "$src" "$dest/$(basename "$src")$([ -e "$dest/$(basename "$src")" ] && echo "_$(date +%s)")" && cd "$dest"; }

# Move file to destination directory with auto-rename and navigation
mvg() { local src=$1 dest=$2; [[ -z "$src" || -z "$dest" ]] && { echo "Usage: mvg <source> <destination>"; return 1; }; mv "$src" "$dest/$(basename "$src")$([ -e "$dest/$(basename "$src")" ] && echo "_$(date +%s)")" && cd "$dest"; }

# Copy current directory to clipboard or destination
cpwd() { ${1:+cp -r "$(pwd)" "$1" && echo "✓ $(pwd) → $1"} || { pwd | xclip -sel c && echo "✓ $(pwd) → clipboard"; }; }

rename() { [[ $# -ne 2 ]] && echo "Usage: rename <old_name> <new_name>" && return 1; mv "$1" "$2"; }

# Load fzf if available
command -v fzf >/dev/null && [[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Go environment
export GOROOT=/usr/local/go && export GOPATH=$HOME/go && export GOPROXY=https://proxy.golang.org,direct && export GO111MODULE=on && export PATH=$GOPATH/bin:$GOROOT/bin:$PATH && export PATH="$HOME/.local/bin:$PATH"

# export FACTORY_DUMMY_KEY="fk-RxwjXySnHUcqG9ICJH54-G7IThYomrit3bjiNs52BwYazSRfj3YDV5wIi-IbYJT8"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
