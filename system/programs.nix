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
    corectrl.enable=true;

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

  virtualisation={
    docker = {
      enable = true;
      # Set up resource limits
      daemon.settings = {
        experimental = true;
        default-address-pools = [
          {
            base = "172.30.0.0/16";
            size = 24;
          }
        ];
      };
    };
  };

  environment = {
    systemPackages = with pkgs; [
      ffmpeg
      gparted
      scanmem
      protege
      (duckstation.overrideAttrs (prev: {
        src = prev.src.overrideAttrs (prevSrc: {
          outputHash = "sha256-ksmxdYLFWYIA3Kp8dztyN4UxeJFvpNRmN79TspwZHuw=";
        });
      }))
      rpcs3
      azahar
      dolphin-emu
      opentrack
      pcsx2
      protonplus
      ppsspp
      xorg.xrdb
      xsettingsd
      posy-cursors
      pear-desktop
      pnpm
      rclone
      rclone-ui
      kara
      kdePackages.krdp
      nero-umu
      volta
      dotnet-sdk
      dotnet-sdk_9
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
      rdflib
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
      wine
      wine64
      wineWowPackages.stable
      winetricks
      foliate
      winboat
    ];
  };
}

