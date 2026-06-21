[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [[ -o interactive ]] && [[ -z "$DOTFILES_NO_WELCOME" ]]; then
  artprint -a desktop -t "Make the effort of being human"
fi
