{pkgs, ...}:
{
    programs.virt-manager.enable = true;

    users.groups.libvirtd.members = ["flkr"];


    virtualisation = {
 /*
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
    */
        libvirtd = {
            enable = true;
                qemu = {
                    package = pkgs.qemu_kvm;
                    runAsRoot = true;
                    swtpm.enable = true;
                    vhostUserPackages = with pkgs; [ virtiofsd ];
                };
        };

        podman = {
            enable = true;
            dockerCompat = true;
        };
    };

    environment.systemPackages = with pkgs;[
    dnsmasq
    distrobox
    podman-compose
    ];
}
