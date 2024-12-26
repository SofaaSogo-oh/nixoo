{ pkgs, config, nixGLWrap, unstable-pkgs, nixvim, ... }: 
let 
  tex = with pkgs; [
    (pkgs.texlive.combine { 
      inherit (pkgs.texlive) scheme-basic
      latex-bin latexmk titlesec minted multirow cleveref
      mathtools babel-russian hyphenat
    ;})
    python312Packages.pygments
  ];
  spkgs = with pkgs; [
    btop
    fastfetch
    vscode
    nixgl.nixGLIntel
    (nixGLWrap krita)
    octaveFull
    nix-search-cli
    git
    lazygit
    gh
    nixvim.packages.${pkgs.system}.default
    python312
  ];
  upkgs = with unstable-pkgs; [
    nerd-fonts.gohufont
    nerd-fonts._3270
  ];
in
{
  fonts.fontconfig.enable = true;
  home.packages = spkgs ++ upkgs ++ tex;
}
