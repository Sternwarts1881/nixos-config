{ pkgs, ... }:

{
  users.users.flkr = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "Deniz Binboğa";
    extraGroups = ["networkmanager" "wheel" "docker" "video" "audio" "corectrl"];
    packages = [];
  };

  system.stateVersion = "25.05";
}
