{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/networking.nix
    ./modules/desktop.nix
    ./modules/users.nix
    ./modules/pkgs.nix
    ./modules/system.nix
  ];

  system.stateVersion = "26.05";
}
