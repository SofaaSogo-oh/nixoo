pkgs: pkg:
let 
  bin = "${pkg}/bin";
  exes = builtins.attrNames (builtins.readDir bin);
in
pkgs.buildEnv {
  name = "nixGL-${pkg.name}";
  paths = map
    (name: pkgs.writeShellScriptBin name ''
      exec -a "$0" ${pkgs.nixgl.nixGLIntel}/bin/nixGLIntel ${bin}/${name} "$@"
    '')
    exes;
}
