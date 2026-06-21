#!/bin/zsh

# oh-my-zsh plugins & themes
if [ -d "$HOME/.oh-my-zsh" ]; then
  if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    pushd $HOME/.oh-my-zsh/custom/plugins
    ln -s $HOME/.oh-my-zsh-custom/plugins/zsh-autosuggestions zsh-autosuggestions 
    popd
  fi
  if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    pushd $HOME/.oh-my-zsh/custom/themes/
    ln -s $HOME/.oh-my-zsh-custom/themes/powerlevel10k powerlevel10k
    popd
  fi
  if [ ! -d "$HOME/.oh-my-zsh/custom/functions" ]; then
    pushd $HOME/.oh-my-zsh/custom/
    ln -s $HOME/.zfunc functions
    popd
  fi
fi

