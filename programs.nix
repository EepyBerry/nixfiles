{ config, lib, pkgs, programs, ...}:

{
  programs = {    
    # SSH agent
    ssh.startAgent = true;
    
    # Browser-specific programs
    firefox.enable = true;
    
    # Steam and Gamemode
    steam.enable = true;
    gamemode.enable = true;
  };
}
