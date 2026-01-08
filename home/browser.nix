{ pkgs, ... }: {

  /* programs.librewolf = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        settings = {
          "sidebar.verticalTabs" = true;
          "sidebar.main.tools" = "history";
          "browser.toolbars.bookmarks.visibility" = "never";
          "sidebar.visibility" = "always-show";
          # "browser.startup.page" = 3;
        };
      };
    };
  }; */

  home.packages = with pkgs; [ 
    brave
    # chromium
  ];
}
