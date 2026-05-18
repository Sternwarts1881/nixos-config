{ pkgs, ... }:

{
  services = {
    displayManager = {
      plasma-login-manager = {
        enable = true;
        settings = {
          wayland.enable = true;
        };
      };
    };
    desktopManager = {
      plasma6.enable = true;
    };
  };

  environment = {
    pathsToLink = [ "/share/zsh" ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    plasma6.excludePackages = with pkgs.kdePackages; [
      khelpcenter
      elisa
    ];
  };
}
