{ config, pkgs, ... }:

{
  # Networking Configuration
  networking = {
    hostName = "nixos";                 # Set hostname
    networkmanager.enable = true;       # Enable NetworkManager
    networkmanager.dns = "none";        # Prevent NetworkManager from managing /etc/resolv.conf
    resolvconf.enable = true;           # Enabled resolvconf
    nameservers = [
      "45.90.28.0"                      # NextDNS Anycast IP
      "45.90.30.0"                      # NextDNS Anycast IP
    ];
  };

  services.resolved.enable = false; # Disable systemd-resolved
}