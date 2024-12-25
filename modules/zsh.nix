{config, pkgs, ...}: {
  programs.thefuck.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      let
        flakeDir = "~/nix";
      in {
        hms = "home-manager switch --flake ${flakeDir}";
        pkgs = "cd ~/nix && nvim . && cd -";
      };
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "vi-mode" "thefuck"];
      theme="agnoster";
    };
  };
}
