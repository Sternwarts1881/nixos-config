{ lib, pkgs, ...}:
{
  home = {
    packages = with pkgs; [
      # home-manager
    ];
    username = "flkr";
    homeDirectory = "/home/flkr";
    stateVersion = "25.05";
  };
  programs = {
    home-manager.enable = true;
  };
}
