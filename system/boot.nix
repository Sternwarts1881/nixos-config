{ config, pkgs, ... }:

let
    kernel = config.boot.kernelPackages.kernel;

in {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    supportedFilesystems.exfat = true;
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "amdgpu.abmlevel=0"
      # "amdgpu.dcdebugmask=0x10"
      # "rcutree.enable_rcu_lazy=1"
      "btusb.enable_autosuspend=0"
      "usbcore.autosuspend=-1"
      # Ajazz AK820 Pro (SONiX 0c45:8009): resume yerine reset ile uyandir
      "usbcore.quirks=0c45:8009:b"
    ];

    kernelModules = ["ntsync"];
  };
}
