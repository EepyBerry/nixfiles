{ config, lib, pkgs, modulesPath, ... }:
{
  services = {
    # XServer
    xserver.videoDrivers = [ "nvidia" ];
    xserver.wacom.enable = true;    

    # Desktop Environment
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;

    # Security
    openssh.enable = true;

    # Printing
    printing.enable = true;

    # Sound  
    pipewire.enable = true;
    pipewire.pulse.enable = true;
  };
}
