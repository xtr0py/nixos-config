{ config, pkgs, ... }:

{
  # Enable AppArmor for application isolation
  security.apparmor.enable = true;
}