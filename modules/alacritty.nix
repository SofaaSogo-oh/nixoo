{pkgs, config, nixGLWrap, ...}: 
{
  programs.alacritty = {
    enable = true;
    package = nixGLWrap pkgs.alacritty;
    settings = {
      window.opacity = 0.7;
      colors.primary.background = "#0e0d15";
      colors.primary.foreground = "#9b2e31";
      font = {
        normal = {
          family = "GohuFont uni11 Nerd Font";
        };
      };
    };
  };
}
