{ config, pkgs, ... }:

{
  # Boot Configuration
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "2";   # Bigger console font
        editor = false;       # Disable bootloader editor for added security
      };
      efi.canTouchEfiVariables = true;
    };
    tmp.cleanOnBoot = true;  # Clear /tmp during boot
    initrd.secrets = {
      "/crypto_keyfile.bin" = null; # Encryption keyfile
    };
  };
}