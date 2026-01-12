{ config, pkgs, ... }:

{
  # Imports
  imports = [
    ./hardware-configuration.nix # Hardware scan configuration
    ./modules/boot.nix           # Boot settings module
  #  ./modules/citrix.nix         # Created FHM citrix workaround due to removed dependencies
    ./modules/libvirt.nix        # Enabling virtualization run citrix via UbuntuVM
    ./modules/networking.nix     # Networking configuration module
    ./modules/localization.nix   # Localization settings module
    ./modules/services.nix       # Services configuration module
    ./modules/users.nix          # User account module
    ./modules/security.nix       # Security configuration module
  ];

  # System Packages
  environment.systemPackages = with pkgs; [
    curl git wget
  ];
  # Citrix needs to be marked as broken in 25.11? 
  # nixpkgs.config.allowBroken = true;

  # Add insecure packages to be removed later
  # nixpkgs.config.permittedInsecurePackages = [
  #              "mbedtls-2.28.10" "libsoup-2.74.3"
  #            ];
  # Enable Citrix Module consider removing since citrix is not a system level
  # services.citrix.enable = true;

  # NixOS Release Version
  system.stateVersion = "23.05"; # Keep this set to the initial install release
}
