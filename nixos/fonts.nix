{ pkgs, ... }: {

  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
    texlivePackages.nunito
    fg-virgil
    excalifont
    # texlivePackages.fontawesome
    # roboto
  ];
}