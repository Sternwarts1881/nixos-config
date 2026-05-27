{pkgs, ...}:
{
    services = {

        howdy = {
            enable = true;
            control = "sufficient";
            settings = {
                video = {
                    dark_threshold = 70;
                };
            };
        };

    linux-enable-ir-emitter = {
        enable = true;
    };







    };
}
