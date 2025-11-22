{ pkgs, inputs, ... }:

let
  pkgs-stable = inputs.nixpkgs-stable.legacyPackages.x86_64-linux;
in {
  programs = {
    direnv.enable = true;
    gamemode.enable = true;
    java.enable = true;
    kdeconnect.enable = true;
    partition-manager.enable = true;
    fish.enable = true;

    corectrl = {
      enable = true;
      gpuOverclock = {
        enable = true;
        ppfeaturemask = "0xffffffff";
      };
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      extraCompatPackages = [pkgs.proton-ge-bin];
    };

  };



  environment = {
    systemPackages = with pkgs; [
      kdePackages.krdp
      pkgs.alacritty
      obsidian
      bottles
      git
      mesa-demos
      jdk17
      kdePackages.plasma-thunderbolt
      lshw
      nil
      nvtopPackages.full
      pkgs.firefox
      neovim
      obs-studio
      okteta
      pkgs.libreoffice
      pciutils
      prismlauncher
      protonup-ng
      protonup-qt
      pkgs.kdePackages.ark
      pkgs.mullvad-vpn
      pkgs.conda
      qbittorrent
      joplin-desktop
      ryzenadj
      steamtinkerlaunch
      unrar
      pkgs-stable.vesktop
      vlc
      pkgs.mpv
      vulkan-tools
      wget
      pkgs.vscode
      (python3.withPackages (ps: with ps;[
      pip
      requests
      numpy
      ]))
      cheese
      chromium
      kdePackages.discover
      pkgs.gnome-clocks
      kdePackages.kcalc
      kdePackages.kate
      kdePackages.okular
      rmpc
      fastfetch
      nano
      powertop
      zip
      unzip
      vim
      python3Packages.defusedxml
      python3Packages.packaging
      python3Packages.pyqt5
      python3Packages.pyqt6
      python3Packages.pywal
      python3Packages.reportlab
      gamescope
      heroic
      lutris
      opentabletdriver
      pkgs.papirus-icon-theme
      pkgs.papirus-folders
      libsForQt5.qtstyleplugin-kvantum
      pkgs.cmake
      pkgs.gnumake
      pkgs.cmakeWithGui
      pkgs.supergfxctl-plasmoid
      pkgs.where-is-my-sddm-theme
      pkgs.libgcc
      wineWowPackages.stable
      winetricks
      foliate
    ];
  };
}
