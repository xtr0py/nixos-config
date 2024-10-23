{ config, pkgs, ... }:

{
  # User Account Configuration
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" ];     
    packages = with pkgs; [
      bleachbit brave citrix_workspace darktable dbeaver-bin flameshot
      htop librewolf linphone networkmanagerapplet obsidian protonvpn-cli
      protonvpn-gui spice spice-gtk teams-for-linux thunderbird vim virt-manager virt-viewer vscodium
      whatsapp-for-linux zoom-us
    ];
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}