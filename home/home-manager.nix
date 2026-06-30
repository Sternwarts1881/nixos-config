{ lib, pkgs, ...}:
{
  home = {
    packages = with pkgs; [
      # home-manager
      kdePackages.kirigami
      kdePackages.kirigami.unwrapped
      kdePackages.qqc2-desktop-style # Kirigami uygulamaları için gerekli arayüz stilleri
      kdePackages.breeze-icons

    ];
    username = "flkr";
    homeDirectory = "/home/flkr";
    stateVersion = "25.05";

    sessionVariables = {
      ANDROID_HOME = "$HOME/Android/Sdk";
      QML2_IMPORT_PATH = "/run/current-system/sw/lib/qt-6/qml:$HOME/.nix-profile/lib/qt-6/qml";
      QT_PLUGIN_PATH = "/run/current-system/sw/lib/qt-6/plugins:$HOME/.nix-profile/lib/qt-6/plugins";
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
