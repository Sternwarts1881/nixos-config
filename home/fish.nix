{pkgs, ...}:
let
  myAliases = {
    java8 = "${pkgs.jdk8}/lib/openjdk/bin/java";
    java17 = "${pkgs.jdk17}/lib/openjdk/bin/java";
  };
in {
  programs = {
    fish = {
      enable = true;
      shellAliases = myAliases;
      generateCompletions = true;
      vendor= {
        functions.enable = true;
        config.enable = true;
        completions.enable = true;

        };
    };
  };
}
