{
  inputs = {
    nixgl.url = "github:nix-community/nixGL";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    unstable-nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:SofaaSogo-oh/nimoo";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {nixgl, nixpkgs, home-manager, flake-utils, unstable-nixpkgs, ...} @ inputs: 
  let
    homeStateVersion = "24.11";
    user = "sogo";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      system = system;
      config.allowUnfree = true;
      overlays = [ nixgl.overlay ];
    };
    unstable-pkgs = import unstable-nixpkgs {
      system = system;
      config.allowUnfree = true;
      overlays = [ nixgl.overlay ];
    };
    nixGLWrap = import ./nixgl.nix pkgs;
  in {
    homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
      pkgs = pkgs;
      modules = [
        ./packages.nix
        ./modules
        {

          home = {
            username = user;
            homeDirectory = "/home/${user}";
            stateVersion = homeStateVersion;
          };
          nix = {
            package = pkgs.nix;
            settings.experimental-features = [ "nix-command" "flakes" ];
          };
          programs.home-manager.enable = true;
        }
      ];
      extraSpecialArgs = {
        inherit nixGLWrap;
        inherit unstable-pkgs;
        inherit (inputs) nixvim;
      };
    };
  };
}
