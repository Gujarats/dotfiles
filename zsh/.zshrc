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

# DIRCOLORS (MacOS)
export CLICOLOR=1

# FZF
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border --margin=1 --padding=1"

# theme
export BAT_THEME="gruvbox-dark"

# nix
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi

source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# nvm node version manger
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> Terminal theme begin <<< 
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# plugin
plugins=(git)
source $ZSH/oh-my-zsh.sh

# adding all executable installed from nix 
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.nix-profile/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# >>> personal alias <<<
alias ll='ls -la'
#list local user
alias list_users='cut -d: -f1 /etc/passwd'
alias pret='git log --pretty=oneline'
alias pret-guj='git log --pretty=oneline --author=gujarat'

# traveloka
alias saml='aws-google-auth --profile saml'
alias tdev='awsudo -u xxt-dev-admin -- terraform'
alias tstg='awsudo -u usr-stg_deployer -- terraform'
alias tstg-gmf='awsudo -u gmf-stg_admin -- terraform'
alias tprod-gmf='awsudo -u gmf-prod_admin -- terraform'
alias tprod='awsudo -u usr-prod_admin -- terraform'
alias postman='~/postman/app/Postman >/dev/null 2>&1 &'
alias datagrip='~/datagrip/bin/datagrip.sh  >/dev/null 2>&1 &'

alias ssmstginstances="awsudo -u usr-stg_deployer -- aws ec2 describe-instances --output table --query 'Reservations[].Instances[].[Tags[?Key==\`Name\`] | [0].Value, State.Name, InstanceId, ImageId]'"
alias ssmprodinstances="awsudo -u usr-prod_admin -- aws ec2 describe-instances --output table --query 'Reservations[].Instances[].[Tags[?Key==\`Name\`] | [0].Value, State.Name, InstanceId, ImageId]'"

alias ssmstginstances-gmf="awsudo -u gmf-stg_admin -- aws ec2 describe-instances --output table --query 'Reservations[].Instances[].[Tags[?Key==\`Name\`] | [0].Value, State.Name, InstanceId, ImageId]'"
alias ssmprodinstances-gmf="awsudo -u gmf-prod_admin -- aws ec2 describe-instances --output table --query 'Reservations[].Instances[].[Tags[?Key==\`Name\`] | [0].Value, State.Name, InstanceId, ImageId]'"

alias ssmstginstances-ugc="awsudo -u ugc-stg -- aws ec2 describe-instances --output table --query 'Reservations[].Instances[].[Tags[?Key==\`Name\`] | [0].Value, State.Name, InstanceId, ImageId]'"
alias ssmstg-ugc='awsudo -u ugc-stg -- aws ssm start-session --target '

alias ssmstg-gmf='awsudo -u gmf-stg_admin -- aws ssm start-session --target '
alias ssmprod-gmf='awsudo -u gmf-prod_admin -- aws ssm start-session --target '

alias ssmstg='awsudo -u usr-stg_deployer -- aws ssm start-session --target '
alias ssmprod='awsudo -u usr-prod_admin -- aws ssm start-session --target '

alias ssmprod-usr='awsudo -u usr-prod_admin -- aws ssm start-session --target '
alias gsts='/usr/local/bin/gsts'
alias awsgsts='$(cat ~/Documents/credentials/awsgsts.txt)'
alias awsgstsloop='$(cat ~/Documents/credentials/awsgstsloop.txt)'
alias pret-guj='git log --author=gujarat --pretty=oneline'
alias pret='git log --pretty=oneline'
alias deploy-gmf='./scripts/deploy.sh --skip-test true -r gmf-stg_admin -s'
alias deploy-usr='./scripts/deploy.sh --skip-test true -s'

# github
GITHUB_TOKEN='$(cat ~/Documents/credentials/github-token.txt)'
alias git-rev='git rev-list --count HEAD ^master'

# GMF services
alias gmftrax-stg='ssmstginstances-gmf | grep gmftrax'
alias gmftrax-prod='ssmprodinstances-gmf | grep gmftrax'

export PATH="$HOME/.tfenv/bin:$PATH"
export PATH="$(python3 -m site --user-base)/bin:${PATH}"
