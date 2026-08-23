{ config, pkgs, ... }:

{
  # display server and desktop environment
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # keyboard layout configuration
  services.xserver.xkb = {
    layout = "it";
    variant = "";
  };
  console.keyMap = "it2";

  # audio and printing services
  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # bluetooth support
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
