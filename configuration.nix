{ config, pkgs, ... }:

{
  # Imports
  imports = [
    ./hardware-configuration.nix # Hardware scan configuration
    ./modules/boot.nix           # Boot settings module
  # ./modules/citrix.nix         # Created FHM citrix workaround due to removed dependencies
    ./modules/libvirt.nix        # Enabling virtualization run citrix via UbuntuVM
    ./modules/localization.nix   # Localization settings
    ./modules/networking.nix     # Networking configuration
    ./modules/podman.nix         # Podman docker container management
    ./modules/security.nix       # Security configuration 
    ./modules/services.nix       # Services configuration 
    ./modules/users.nix          # User account 
  ];

  # Feature toggles / high-level enables
  my = {
    podman.enable = true;
  };

  # System Packages
  environment.systemPackages = with pkgs; [
    curl git wget
  ];
 
  # NixOS Initial Installation Version
  system.stateVersion = "23.05"; 
}
