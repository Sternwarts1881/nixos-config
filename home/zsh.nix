{ pkgs, ... }:

let
  myAliases = {
    fedora-enter-ml-env = "source /home/flkr/.conda/bin/activate tf_gpu_env";
  };

in
{
programs = {

  starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      # add_newline = false;
       character = {
         #success_symbol = "[➜](bold green)";
         #error_symbol = "[➜](bold red)";
       };
      # package.disabled = true;
        username = {
          style_user = "blue bold";
          style_root = "red bold";
          format = "[$user]($style) ";
          disabled = false;
          show_always = true;
      };
        hostname = {
          ssh_only = false;
          ssh_symbol = "🌐 ";
          format = "on [$hostname](bold green) ";
          trim_at = ".local";
          disabled = false;
      };
    };
  };

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = myAliases;
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
