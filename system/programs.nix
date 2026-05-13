{ pkgs, inputs, ... }:

let
  pkgs-stable = inputs.nixpkgs-stable.legacyPackages.x86_64-linux;
in {
  programs = {
    gamemode.enable = true;
    java.enable = true;
    kdeconnect.enable = true;
    partition-manager.enable = true;
    zsh.enable = true;
    npm.enable = true;
    corectrl.enable=true;


    appimage = {
      enable = true;
      binfmt = true;
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
      texliveFull
      vesktop
      cargo
      rustc
      onlyoffice-desktopeditors
      eas-cli
      code-cursor
      cursor-cli
      ryubing
      tor
      tor-browser
      proton-vpn
      android-studio
      android-tools
      ntfs3g
      tree-sitter
      haruna
      starship
      ghostty
      jetbrains.rider
      gnome-tweaks
      ffmpeg
      gparted
      scanmem
      rpcs3
      azahar
      dolphin-emu
      pcsx2
      protonplus
      ppsspp
      xrdb
      xsettingsd
      posy-cursors
      pear-desktop
      pnpm
      rclone
      kdePackages.krdp
      nero-umu
      volta
      dotnet-sdk_9
      nodejs_20
      nodemon
      obsidian
      git
      mesa-demos
      jdk21
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
      opentabletdriver
      papirus-icon-theme
      papirus-folders
      libsForQt5.qtstyleplugin-kvantum
      cmake
      gnumake
      cmakeWithGui
      supergfxctl-plasmoid
      libgcc
      gcc
      wine
      wine64
      wineWow64Packages.stable
      winetricks
      foliate
      winboat
    ];
  };
}

