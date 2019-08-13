{ config, pkgs, lib, ... }:

{ i18n = {
    consoleFont = "Fira Mono";
    consoleUseXkbConfig = true;
  # inputMethod = {
  #   fcitx.engines = with pkgs; [
  #     rime
  #   ];
  # };
  };
}
