{ lib, pkgs, ...}:
{
  home = {
    packages = with pkgs; [
      # home-manager
      kdePackages.kirigami
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
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
