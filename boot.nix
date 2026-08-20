{ config, lib, pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_6_18;
    blacklistedKernelModules = [ "nouveau" ];
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        windows = {
          "windows" =
            let
              # To determine the name of the windows boot drive, boot into edk2 first, then run
              # `map -c` to get drive aliases, and try out running `FS1:`, then `ls EFI` to check
              # which alias corresponds to which EFI partition.
              boot-drive = "FS2";
            in
            { 
              title = "Windows 10 Professional";
              efiDeviceHandle = boot-drive;
              sortKey = "y_windows";
            };
        };
        edk2-uefi-shell.enable = true;
        edk2-uefi-shell.sortKey = "z_edk2";
      };
    };
  };

  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    nvidia-container-toolkit.enable = true;
  };

  virtualisation.docker.daemon.settings.features.cdi = true;
}
