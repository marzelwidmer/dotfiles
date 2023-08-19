# Helsana
source ~/.helsana_variables

# Node
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# PLUGINS
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-navigation-tools
	oc
	kubectl
	brew
	minikube
	spring
	colored-man-pages
	httpie
	history
	gradle
	helm
  kube-ps1
)

# OH-MY-ZSH
source ~/.oh-my-zsh/oh-my-zsh.sh

# SDKMAN
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Starship
eval "$(starship init zsh)"

# TheFuck
#eval $(thefuck --alias)

# Zoxide
eval "$(zoxide init zsh)"


# DOTFILES
source ~/.variables
source ~/dotfiles/.aliases


