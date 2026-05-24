{ lib, ...}:

{
  networking = {
    hostName = "nixos";

    networkmanager = {
      enable = true;
      wifi = {
   #     backend = "iwd";
        powersave = false;
      };
    };


    wireless.iwd = {
   #   enable = true;
      settings = {
        General = {
          RoamThreshold = -75;
          RoamThreshold5G = -80;
          RoamRetryInterval = 20;
        };
      };
    };

    firewall = {
      enable = true;
      trustedInterfaces = [ "tailscale0" ];
    };
  };

  services = {
    resolved.enable = true;


    tailscale.enable = true;
  };

}
