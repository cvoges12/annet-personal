{ config, lib, pkgs, ... }:

{
  programs = {
    adb.enable = true;
    bash.enableCompletion = false;
    browserpass.enable = true;
    gnupg.agent = {
      enable = true;
      enableBrowserSocket = true;
      enableSSHSupport = true;
    };
    ssh.startAgent = false;
    mtr.enable = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      enableGlobalCompInit = true;
      autosuggestions.enable = true;
      ohMyZsh = {
        enable = true;
      };
      syntaxHighlighting.enable = true;
    };
  };
}
