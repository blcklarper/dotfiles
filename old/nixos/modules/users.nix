{ config, pkgs, ... }:

{
  # user account definition
  users.users."blck" = {
    isNormalUser = true;
    description = "blck";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" "audio" "video" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
