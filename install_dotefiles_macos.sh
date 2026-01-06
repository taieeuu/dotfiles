#! /bin/bash

################
# stow'd files #
################

# Special-case zsh and authinfo because they do not follow the XDG spec
stow -vt ~ zsh
# stow -vt ~ authinfo

# for component in \
# 		doom \
# 		pip \
# 		skhd \
# 		tmux \
# 		yabai; do
# 	mkdir -p ${CONFIG_HOME}/${component}
# 	stow -vt ${CONFIG_HOME}/${component} ${component}
# done

#######################
# end of stow'd files #
#######################


###################
#     zsh area    #
###################

if [ ! -d ~/.oh-my-zsh ]; then
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi

ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

plugin_definitions=(
  "zsh-autosuggestions"
  "zsh-completions"
  "zdharma-continuum fast-syntax-highlighting"
  "chrissicool zsh-256color"
  "Aloxaf fzf-tab"
)

for entry in "${plugin_definitions[@]}"; do
  user="zsh-users"
  plugin=""
  read -r first second <<< "$entry"
  if [[ -n $second ]]; then
    user="$first"
    plugin="$second"
  else
    plugin="$first"
  fi
  target_dir="$ZSH_CUSTOM/plugins/$plugin"
  if [ ! -d "$target_dir" ]; then
    git clone "https://github.com/$user/$plugin" "$target_dir"
  fi
done

theme_user=romkatv
theme_name=powerlevel10k
theme_dir="$ZSH_CUSTOM/themes/$theme_name"
if [ ! -d "$theme_dir" ]; then
  git clone --depth=1 "https://github.com/$theme_user/$theme_name.git" "$theme_dir"
fi

###################
# end of zsh area #
###################