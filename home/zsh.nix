{ pkgs, ... }:
{
  programs = {

starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      # add_newline = false;

       character = {
         success_symbol = "[➜](bold green)";
         error_symbol = "[➜](bold red)";
       };

      # package.disabled = true;
    };
  };


    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "history"
          "wd"
        ];
      };
    };
  };
}
