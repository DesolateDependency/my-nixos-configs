{ ... }: {

  home.file.".config/waybar/config.jsonc".source = ./dotfiles/waybar/config.jsonc;
  home.file.".config/waybar/launch-waybar.sh".source = ./dotfiles/waybar/launch-waybar.sh;
  home.file.".config/waybar/style.css".source = ./dotfiles/waybar/style.css;
}