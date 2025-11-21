{ pkgs, ... }:

{
  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
    desktopManager = {
      plasma6.enable = true;
    };
  };

  environment = {
    pathsToLink = [ "/share/fish" ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    plasma6.excludePackages = with pkgs.kdePackages; [
      khelpcenter
      elisa
    ];
  };
}
