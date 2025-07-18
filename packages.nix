{ pkgs, config, nixGLWrap, unstable-pkgs, nixvim, ... }: 
let 
  tex = with pkgs; [
    (pkgs.texlive.combine { 
      inherit (pkgs.texlive) scheme-medium
      xetex latex-bin latexmk titlesec minted multirow cleveref
      mathtools babel-russian hyphenat 
      fontspec xltxtra realscripts xecyr upquote
    ;})
    python312Packages.pygments
  ];
  spkgs = with pkgs; [
    btop
    fastfetch
    # vscode
    # nixgl.nixGLIntel
    # (nixGLWrap krita)
    # octaveFull
    nix-search-cli
    git
    lazygit
    gh
    nixvim.packages.${pkgs.system}.default
    python312
    fontconfig
    zathura
    ripgrep

    sbcl
    clang
    cmake
    asdf

    ghc
  ];
  upkgs = with unstable-pkgs; [
    nerd-fonts.gohufont
    nerd-fonts._3270
    corefonts liberation_ttf
    font-manager
  ];
in
{
  fonts.fontconfig.enable = true;
  home.packages = spkgs ++ upkgs ++ tex;
}
