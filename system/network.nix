{ lib, ...}:

{
  networking = {
    hostName = "nixos";

    networkmanager = {
      enable = true;
    };

    firewall = {
      enable = true;
      trustedInterfaces = [ "tailscale0" "wlp3s0" "wg0-mullvad" "virbr0"];
    };
  };

  services = {
    resolved.enable = true;


    tailscale.enable = true;
  };

}
