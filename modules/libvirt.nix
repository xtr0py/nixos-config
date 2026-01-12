{ config, pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Needed so your non-root user can manage system libvirt via virt-manager
  security.polkit.enable = true;

  # Minimal useful tooling (optional but common)
  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}