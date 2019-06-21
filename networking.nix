{ config, lib, pkgs, ... }:

{
  networking = {
    firewall = {
      allowPing = true;
      allowedTCPPorts = [ 22 53 80 443 41197 ];
      allowedUDPPorts = [ 53 67 68 80 123 433 41197 ];
      # shorten to allowed number of mosh connections
      # uncomment when setting up mosh
      #allowedUDPPortRanges = [
      #  { from = 60000;
      #    to = 61000; }
      #];
      checkReversePath = true;
      logRefusedConnections = true;
      logRefusedPackets = true;
      logRefusedUnicastsOnly = true;
      logReversePathDrops = true;
      pingLimit = "--limit 1/minute --limit-burst 5";
    };
    nameservers = [ "1.1.1.1" ];
    usePredictableInterfaceNames = true;
  };
}
