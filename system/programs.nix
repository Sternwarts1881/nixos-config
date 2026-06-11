{ pkgs, ... }:

{
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

  environment = {
    systemPackages = with pkgs; [
      osu-lazer-bin
      pods
      polychromatic
      proton-pass
      texliveFull
      linux-router
      vesktop
      cargo
      rustc
      onlyoffice-desktopeditors
      code-cursor
      cursor-cli
      ryubing
      tor
      tor-browser
      proton-vpn
      ntfs3g
      tree-sitter
      haruna
      starship
      ghostty
      gnome-tweaks
      ffmpeg
      gparted
      scanmem
      rpcs3
      azahar
      dolphin-emu
      pcsx2
      protonplus
      xrdb
      xsettingsd
      posy-cursors
      pear-desktop
      pnpm
      rclone
      kdePackages.krdp
      nero-umu
      volta
      dotnet-sdk
      nodejs
      nodemon
      obsidian
      git
      mesa-demos
      jdk
      kdePackages.plasma-thunderbolt
      lshw
      nil
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
        rdflib
        defusedxml
        packaging
        pyqt5
        pyqt6
        pywal
        reportlab
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
    ];
  };
}

