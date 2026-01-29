{ config, lib, ... }:

let
  cfg = config.my.podman;
in
{
  options.my.podman.enable =
    lib.mkEnableOption "Enable Podman as a Docker-compatible container runtime";

  config = lib.mkIf cfg.enable {
    virtualisation.containers.enable = true;

    virtualisation.podman = {
      enable = true;

      # Make `docker` use podman
      dockerCompat = true;

      # Provide Docker-compatible socket
      dockerSocket.enable = true;

      # Better networking for compose
      defaultNetwork.settings.dns_enabled = true;
    };

    # Needed for rootless containers on NixOS
    security.unprivilegedUsernsClone = true;
  };
}
