{ pkgs, inputs, ... }:

let
  pkgs-stable = inputs.nixpkgs-stable.legacyPackages.x86_64-linux;
in {
  programs = {
    gamemode.enable = true;
    java.enable = true;
    kdeconnect.enable = true;
    partition-manager.enable = true;
    fish.enable = true;
    npm.enable = true;

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

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

  };



  environment = {
    systemPackages = with pkgs; [
      ffmpeg
      kdePackages.krdp
      nero-umu
      volta
      dotnet-sdk
      nodejs_20
      nodejs
      nodemon
      alacritty
      obsidian
      bottles
      git
      mesa-demos
      jdk17
      kdePackages.plasma-thunderbolt
      lshw
      nil
      nvtopPackages.full
      firefox
      neovim
      obs-studio
      okteta
      libreoffice
      pciutils
      prismlauncher
      protonup-ng
      protonup-qt
      kdePackages.ark
      mullvad-vpn
      conda
      qbittorrent
      joplin-desktop
      ryzenadj
      steamtinkerlaunch
      unrar
      pkgs-stable.vesktop
      vlc
      mpv
      vulkan-tools
      wget
      vscode
      (python3.withPackages (ps: with ps;[
      pip
      requests
      numpy
      ]))
      cheese
      chromium
      kdePackages.discover
      gnome-clocks
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
      papirus-icon-theme
      papirus-folders
      libsForQt5.qtstyleplugin-kvantum
      cmake
      gnumake
      cmakeWithGui
      supergfxctl-plasmoid
      where-is-my-sddm-theme
      libgcc
      wineWowPackages.stable
      winetricks
      foliate
      winboat
    ];
  };
}
