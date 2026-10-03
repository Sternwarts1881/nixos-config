{ pkgs, ... }:

{
  users.users.flkr = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Deniz Binboğa";
    extraGroups = ["networkmanager" "wheel" "docker" "video" "audio" "corectrl" "adbusers" "kvm" "libvirtd" "openrazer" ];
    packages = [];
  };

  system.stateVersion = "25.05";
}
