{ config, pkgs, ... }: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Desdpy";
        email = "github.com.passerby609@passfwd.com";
      };
      aliases = {
        graph = "log --graph --date-order --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'";
        fullgraph = "log --graph --date-order --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'";
      };
      init.defaultBranch = "main";
    };
  };
}
