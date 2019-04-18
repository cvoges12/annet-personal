{ config, lib, pkgs, ... }:

{
  programs = {
    bash.enableCompletion = false;
    browserpass.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    mtr.enable = true;
    tmux = {
      enable = true;
      secureSocket = true;
    };
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
