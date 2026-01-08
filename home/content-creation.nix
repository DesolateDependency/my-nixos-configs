{ pkgs, ... }: {

  home.packages = with pkgs; [ 
    # obs-studio
    # kdePackages.kdenlive
    # davinci-resolve
    krita
  ];
}