{ pkgs,lib, ... }:

{
  services = {
    fstrim.enable = true;
    fwupd.enable = true;
    printing.enable = true;
    system76-scheduler.enable = true;

    udev.extraRules = ''
  ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="0bda", ATTR{idProduct}=="8153", ATTR{power/autosuspend}="-1"
  ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="0bda", ATTR{idProduct}=="8153", ATTR{power/control}="on"
'';

    xserver = {
      enable = true;
      wacom.enable = true;
    };
    power-profiles-daemon.enable = true;
    locate.enable = true;
    smartd.enable = true;
    openssh.enable = true;
    mullvad-vpn.enable = true;
    mullvad-vpn.package = pkgs.mullvad-vpn;
    supergfxd.enable = true;
    asusd = {
      enable = true;
    };
    flatpak.enable = true;
  };

  powerManagement.resumeCommands = ''
  # r8152 sürücüsünü (Realtek Ethernet) yeniden başlat
  ${pkgs.kmod}/bin/modprobe -r r8152
  ${pkgs.kmod}/bin/modprobe r8152
'';

  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };
   
 systemd = {

  slices."nix-daemon".sliceConfig = {
    ManagedOOMMemoryPressure = "kill";
    ManagedOOMMemoryPressureLimit = "80%";
  };

  services = {

    "polkit-agent-helper@" = {

      overrideStrategy = "asDropin";

      serviceConfig = {

        ReadOnlyPaths = "/usr/lib/security";

        ProtectHome = "no";

        PrivateDevices = "no";

        DeviceAllow = "char-video4linux rw";

      };

    };

    "nix-daemon".serviceConfig = {
      Slice = "nix-daemon.slice";
      OOMScoreAdjust = 1000;
    };

  };

};
}
