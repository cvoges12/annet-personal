{ config, lib, pkgs, ... }:

{
  services = {
    #actkbd.enable = true;
    #apache-kafka.enable = true;
    #apcupsd.enable = true;
    #arbtt.enable = true;
    printing.enable = true;
    fprintd.enable = true;
    #firefox.syncserver.enable = true;
    #flexget.enable = true;
    #gitea.enable = true;
    #gitlab.enable = true;
    #glusterfs.enable = true;
    #graphana.enable = true;
    #graylog.enable = true;
    #haka.enable = true;
    #haproxy.enable = true;
    #home-assistant.enable = true;
    #hostapd.enable = true;
    #i2pd.enable = true;
    #ipfs.enable = true;
    #opensmtpd.enable = true;
    #pipewire.enable = true;
    #plex.enable = true;
    #prometheus.enable = true;
    #unifi.enable = true;
    xserver = {
      enable = true;
      autorun = true;
      #layout = "cn,de,is,us";
      xkbVariant = "colemak";
      xkbOptions = "altwin:swap_alt_win,caps:bksp";
      startDbusSession = true;
      terminateOnReset = true;
      libinput = {
        enable = true;
        tapping = false;
      };
      synaptics.enable = false;

      windowManager = {
        i3 = {
          enable = true;
          package = pkgs.i3-gaps;
        };
        default = "i3";
      };
      desktopManager.xterm.enable = false;
    };
    pcscd.enable = true;
    udev.packages = with pkgs; [
      android-udev-rules
      yubikey-personalization
    ];
    nixosManual.showManual = true;
  };
}
