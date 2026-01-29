{ config, lib, pkgs, ... }:

let
  cfg = config.my.podman;
in
{
  options.my.podman.enable =
    lib.mkEnableOption "Enable Podman(Docker-compatible) + Podman Desktop";

  config = lib.mkIf cfg.enable {
    virtualisation.containers.enable = true;

    virtualisation.podman = {
      enable = true;

      # Make `docker` use podman
      dockerCompat = true;

      # Docker-compatible socket (only needed for some Docker-API tooling)
      dockerSocket.enable = lib.mkDefault false;

      # Better networking for compose
      defaultNetwork.settings.dns_enabled = true;
    };

    # Needed for rootless containers on NixOS
    security.unprivilegedUsernsClone = true;

    # Install the GUI (Podman Desktop) + small helpers commonly useful with rootless
    environment.systemPackages = with pkgs; [
      podman-desktop
      slirp4netns
      fuse-overlayfs
    ];  
  };
}
