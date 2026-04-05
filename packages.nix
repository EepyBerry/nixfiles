{ config, pkgs, inputs, ... }:
let
  kde6 = with pkgs; [
    kdePackages.discover # Optional: Software center for Flatpaks/firmware updates
    kdePackages.kcalc # Calculator
    kdePackages.kcharselect # Character map
    kdePackages.kclock # Clock app
    kdePackages.kcolorchooser # Color picker
    kdePackages.kolourpaint # Simple paint program
    kdePackages.ksystemlog # System log viewer
    kdePackages.sddm-kcm # SDDM configuration module
    kdiff3 # File/directory comparison tool
    # Hardware/System Utilities (Optional)
    kdePackages.isoimagewriter # Write hybrid ISOs to USB
    kdePackages.partitionmanager # Disk and partition management
  ];

  dev = with pkgs; [
    jetbrains-toolbox
    git
    wget
  ];

  graphics = with pkgs; [
    blender
    aseprite
    drawio
    krita
  ];

  software = with pkgs; [
    discord
  ];

  multimedia = with pkgs; [
    obs-studio
    vlc
    easyeffects
  ];

  utils = with pkgs; [
    nvtopPackages.nvidia
    hardinfo2
    wayland-utils
    wl-clipboard
    pciutils
    tree
    fastfetch
    nano
  ];
in
{
  environment.systemPackages = with pkgs; []
  ++ kde6
  ++ dev
  ++ graphics
  ++ software
  ++ multimedia
  ++ utils;
}
