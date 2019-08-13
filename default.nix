{ ... }:

{ imports = [
    ./docs.nix
    ./environment.nix
    ./fonts.nix
    ./hardware.nix
    ./home.nix
    ./i18n.nix
    ./networking.nix
    ./nix.nix
    ./nixpkgs.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./sound.nix
    ./systemd.nix
    ./time.nix
    ./users.nix
    ./xdg.nix
    (import (builtins.fetchGit {
      url = "https://github.com/rycee/home-manager.git";
      ref = "master";}) {}).nixos
  ];
}
