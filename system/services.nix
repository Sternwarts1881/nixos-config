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

  howdy = {
    enable = true;
    control = "sufficient";
    settings = {
      video = {
        dark_threshold = 80;
      };
    };
  };
  linux-enable-ir-emitter = {
    enable = true;
  };

  };

  powerManagement.resumeCommands = ''
  # r8152 sürücüsünü (Realtek Ethernet) yeniden başlat
  ${pkgs.kmod}/bin/modprobe -r r8152
  ${pkgs.kmod}/bin/modprobe r8152
'';

  zramSwap = {
    enable = true;
  };
   

}
