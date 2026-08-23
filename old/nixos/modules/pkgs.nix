{ config, pkgs, ... }:

{
  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # system packages list
  environment.systemPackages = with pkgs; [
    # development tools
    git
    gcc
    rustc
    cargo
    python3
    jdk25
    openjfx

    # terminal utilities
    vim
    neovim
    fastfetch
    kitty
    curl
    wget

    # desktop applications
    flatpak
    brave
  ];
}
