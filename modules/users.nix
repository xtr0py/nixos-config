{ config, pkgs, ... }:

{
  # User Account Configuration
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "kvm" ];     
    packages = with pkgs; [
      bleachbit bluez blueman brave darktable dbeaver-bin flameshot
      htop librewolf  networkmanagerapplet obsidian protonvpn-gui 
      spice spice-gtk teams-for-linux thunderbird vim virt-manager virt-viewer vscodium
      wasistlos zoom-us
      #citrix_workspace_24_11_0
      #linphonePackages.linphone-desktop      #package name changed need to test on rebuild
    ];
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}