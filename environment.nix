{ config, lib, pkgs, ... }:

let
  unstable = import 
    (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) { };
in
{
  environment = {
    pathsToLink = [ "/share/zsh" ];
    sessionVariables = {
      EDITOR = "nvim";
    };
    shellInit = ''
      export GPG_TTY="$(tty)"
      gpg-connect-agent /bye
      export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
    '';
    systemPackages = with pkgs; [

      # Applications
      ## Audio
      caudec
      mpc_cli
      ncmpcpp

      ## Editors
      android-studio
      (import ./nvim.nix)

      ## Graphics
      feh

      ## Misc
      calcurse
      dmenu
      khard
    # mop
      mpvc
      rtv
      rxvt_unicode
      urxvt_font_size
      wego
      zathura
      
      ## Networking
      ### Browsers
      firefox
      surf

      ### Feedreaders
      newsboat

      ### IDS
    # snort

      ### Instant-Messengers
      profanity
      signal-desktop
      tdesktop
      telegram-cli
      
      ### IRC
      weechat

      ### Mailreaders
    # mailsync  # maybe checkout too?
    # neomutt
    # notmuch # maybe check out `notmuch-mutt`
      
      ### Newsreaders
      slrn

      ### Sniffers
      wireshark

      ## Office
      libreoffice

      ## Video
      mpv
      obs-studio

      ## Window-Manager
      i3-gaps
      i3blocks-gaps
      i3lock
      i3status

      # Build-Support
      ## CC-Wrapper
      clang
      gcc

      ## Trivial-Builder
      texlive.combined.scheme-full
    # vimPlugins.pluginnames2nix  # use this in the future

      # Development
      ## Compilers
      chez
      gforth
      ghc
      llvm
      openjdk
      racket

      ## Haskell-Modules
      ### Hackage-Packages
      dhall
      dhall-bash
      dhall-json
      haskellPackages.cabal2nix
      haskellPackages.cabal-install
      haskellPackages.djinn
      haskellPackages.ghcid
      haskellPackages.ghcjs-dom
      haskellPackages.hdevtools
      haskellPackages.hledger
      haskellPackages.hlint
      haskellPackages.hoogle
      haskellPackages.pandoc
      haskellPackages.pointfree
      haskellPackages.shelly
      haskellPackages.stack
      haskellPackages.yesod


      #### BROKEN ####
    # dhall-nix
    # haskellPackages.Agda
    # haskellPackages.blunt
    # haskellPackages.Chart
    # haskellPackages.ghcjs-base-stub
    # haskellPackages.hnix
    # haskellPackages.intero
    # haskellPackages.PandocAgda
    # haskellPackages.pointfree-fancy
    # haskellPackages.reflex

      ## Interpreters
      guile
      python37Full

      ## Libraries
      gnutls
      hunspell
      libnotify

      ## Python-Modules
      python37Packages.glances


      ## Tools
      ### Misc
      dialog
      ycmd

      ## Web
      csslint

      # Misc
      ## Emulators
      wine

      # OS-Specific
      ## Linux
      iotop
      powertop
      psmisc
    # linuxPackages.wireguard

      # Servers
    # clamsmtp
    # quagga

      # Tools
      ## Archivers
      unrar
      unzip
      zip

      ## Filesystems
      android-file-transfer

      ## Graphics
      maim
      pywal
      escrotum

      ## Misc
      neofetch
      tldr
      vdirsyncer # for khal and khard
      youtube-dl
      yubikey-personalization

      ## Networking
    # aircrack-ng
    # offlineimap
      traceroute
      wget
      whois
      
      ## Security
    # clamav
    # john
    # metasploit
      nmap
      pass
      passff-host
    # thc-hydra

      ## System
      htop
      lshw
      ps_mem
      tree

      ## Text
      ripgrep

      ## X11
      arandr
    ];
  };
}
