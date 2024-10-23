{ config, pkgs, ... }:

{
  # Imports
  imports = [
    ./hardware-configuration.nix # Hardware scan configuration
    ./modules/boot.nix           # Boot settings module
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

  # NixOS Release Version
  system.stateVersion = "23.05"; # Keep this set to the initial install release
}