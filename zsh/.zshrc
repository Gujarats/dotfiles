# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Export nvm completion settings for lukechilds/zsh-nvm plugin
# Note: This must be exported before the plugin is bundled
export NVM_DIR=${HOME}/.nvm
export NVM_COMPLETION=true

source ${HOME}/.zsh_plugins.sh

# Bundle zsh plugins via antibody
alias update-antibody='antibody bundle < $HOME/.zsh_plugins.txt > $HOME/.zsh_plugins.sh'

# DIRCOLORS (MacOS)
export CLICOLOR=1

# FZF
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border --margin=1 --padding=1"

# theme
export BAT_THEME="gruvbox-dark"

# nix
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# nvm node version manger
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/gujaratsantana/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/gujaratsantana/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/gujaratsantana/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/gujaratsantana/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# personal alias 
alias ll='ls -la'
#list local user
alias list_users='cut -d: -f1 /etc/passwd'

# traveloka alias
alias saml='aws-google-auth --profile saml'
alias tdev='awsudo -u xxt-dev-admin -- terraform'
alias tstagin='awsudo -u xxt-stg-admin -- terraform'
alias tprod='awsudo -u xxt-prod_deployer -- terraform'

alias ssmstginstances="awsudo -u usr-stg_deployer -- aws ec2 describe-instances --output table --query 'Reservations[].Instances[].[Tags[?Key==\`Name\`] | [0].Value, State.Name, InstanceId, ImageId]'"
alias ssmprodinstances="awsudo -u usr-prod_admin -- aws ec2 describe-instances --output table --query 'Reservations[].Instances[].[Tags[?Key==\`Name\`] | [0].Value, State.Name, InstanceId, ImageId]'"


alias ssmstg='awsudo -u usr-stg_deployer -- aws ssm start-session --target '
alias ssmprod='awsudo -u usr-prod_admin -- aws ssm start-session --target '
