{ pkgs,pkgs-stable ,... }:

{
    programs = {
        niri = {
            enable = true;
        };
    };

  environment = {
    systemPackages = with pkgs; [
    #noctalia-shell
    ];};

}
