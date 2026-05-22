{pkgs, ...}:
{
    services = {

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
}
