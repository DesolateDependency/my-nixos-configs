{ pkgs, ... }: {

  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
    texlivePackages.nunito
    fg-virgil
    # texlivePackages.fontawesome
    # roboto
  ];
}