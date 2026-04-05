{ config, libs, pkgs, ... }:
{
  users.users.eepyberry = {
    isNormalUser = true;
    createHome = true;
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };
}
