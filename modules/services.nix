{ config, pkgs, ... }:

{
  # Graphical Environment Configuration
  services = {
    xserver.enable = false;  # Disable X server for Wayland
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;  # Enable Plasma 6
    
    # Optional: Enable XWayland for legacy X11 applications
    # xwayland.enable = true;

    # Printing Service
    printing.enable = false; # Disable printing service for now
  };
}