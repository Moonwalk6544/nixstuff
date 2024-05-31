{ config, lib, pkgs, modulesPath, ... }:
{
 imports = [ ];
  networking.extraHosts =
        ''
        10.129.134.239 unika.htb
        '';
}
