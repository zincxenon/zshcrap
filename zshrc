# @author     Sebastian Tramp <mail@sebastian.tramp.name>
# @license    http://opensource.org/licenses/gpl-license.php
#
# the main RC file (will be linked to ~/.zshrc)
#
plugins=(rails git ruby common-aliases)
# first include of the environment
source $HOME/.config/zsh/environment.zsh

typeset -ga sources
sources+="$ZSH_CONFIG/environment.zsh"
sources+="$ZSH_CONFIG/options.zsh"

sources+="$ZSH_CONFIG/aliases.zsh"
sources+="$ZSH_CONFIG/config.zsh"
sources+="$ZSH_CONFIG/git-aliases.zsh"
#sources+="$ZSH_CONFIG/paths.zsh"

sources+="$ZSH_CONFIG/hayne-aliases.zsh"

# highlights the live command line
# Cloned From: git://github.com/nicoulaj/zsh-syntax-highlighting.git
sources+="$ZSH_CONFIG/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# provides the package name of a non existing executable
# (sudo apt-get install command-not-found)
sources+="/etc/zsh_command_not_found"

# Check for a system specific file
systemFile=`uname -s | tr "[:upper:]" "[:lower:]"`
sources+="$ZSH_CONFIG/$systemFile.zsh"

# Private aliases and adoptions
sources+="$ZSH_CONFIG/private.zsh"

# completion config needs to be after system and private config
sources+="$ZSH_CONFIG/completion.zsh"

# fasd integration and config
sources+="$ZSH_CONFIG/fasd.zsh"

# Private aliases and adoptions added at the very end (e.g. to start byuobu)
#sources+="$ZSH_CONFIG/private.final.zsh"


# try to include all sources
foreach file (`echo $sources`)
    if [[ -a $file ]]; then
        source $file
    fi
end


plugins=(git)



# Prompt at end of command line
RPROMPT="[%t]"
fg_light_red=$'%{\e[1;31m%}'

# my .zshenv *N*
autoload -U compinit
compinit
autoload      edit-command-line
zle -N        edit-command-line
bindkey '\ee' edit-command-line
VISUAL='usr/bin/vim'
EDITOR='usr/bin/vim'


alias -g ND='*(/om[1])' # newest directory
alias -g NF='*(.om[1])' # newest file




