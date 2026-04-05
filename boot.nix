{ config, lib, pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
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
      open = true;

      # Driver package
      package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "580.126.18";
        sha256_64bit = "sha256-p3gbLhwtZcZYCRTHbnntRU0ClF34RxHAMwcKCSqatJ0="; 
        sha256_aarch64 = "sha256-pruxWQlLurymRL7PbR24NA6dNowwwX35p6j9mBIDcNs=";
        openSha256 = "sha256-1Q2wuDdZ6KiA/2L3IDN4WXF8t63V/4+JfrFeADI1Cjg=";
        settingsSha256 = "sha256-QMx4rUPEGp/8Mc+Bd8UmIet/Qr0GY8bnT/oDN8GAoEI=";
        persistencedSha256 = "";
      };
    };
  };
  
  virtualisation = {
    docker.enable = true;
  };
}
