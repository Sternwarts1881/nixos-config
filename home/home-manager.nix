{ lib, pkgs, ...}:
{
  home = {
    packages = with pkgs; [
      # home-manager
    ];
    username = "flkr";
    homeDirectory = "/home/flkr";
    stateVersion = "25.05";

    sessionVariables = {
      ANDROID_HOME = "$HOME/Android/Sdk";
    };

    sessionPath = [
      "$HOME/Android/Sdk/emulator"
      "$HOME/Android/Sdk/platform-tools"
    ];

  };
  programs = {
    home-manager.enable = true;
  };
}
