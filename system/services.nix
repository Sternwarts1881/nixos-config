{ pkgs, ... }:

{
  services = {
    fstrim.enable = true;
    fwupd.enable = true;
    printing.enable = true;
    system76-scheduler.enable = true;

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
      enableUserService = true;
    };
    flatpak.enable = true;

  };

  powerManagement.resumeCommands = ''
  # r8152 sürücüsünü (Realtek Ethernet) yeniden başlat
  ${pkgs.kmod}/bin/modprobe -r r8152
  ${pkgs.kmod}/bin/modprobe r8152
'';



}
