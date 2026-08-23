{ config, pkgs, ... }:

{
  # networking and hostname configuration
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
}
