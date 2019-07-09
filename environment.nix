{ config, lib, pkgs, ... }:

{
  environment = {
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
      #mailsync  # maybe checkout too?
      #neomutt
      #notmuch # maybe check out `notmuch-mutt`

      ### Remote
      teamviewer
      
      ### Sniffers
      #wireshark

      ## Office
      libreoffice

      ## Video
      mpv

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
      #libreoffice
      texlive.combined.scheme-full
      #vimPlugins.pluginnames2nix  # use this in the future

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
      haskellPackages.pandoc
      haskellPackages.pointfree
      haskellPackages.shelly
      haskellPackages.stack
      haskellPackages.yesod


      #### BROKEN ####
      #unstable.dhall-nix
      #haskellPackages.Agda
      #haskellPackages.blunt
      #haskellPackages.Chart
      #haskellPackages.ghcjs-base-stub
      #haskellPackages.hnix
      #haskellPackages.intero
      #haskellPackages.PandocAgda
      #haskellPackages.pointfree-fancy
      #haskellPackages.reflex

      ## Interpreters
      guile
      python37Full

      ## Libraries
      gnutls
      hunspell
      libnotify

      ## Tools
      ### Misc
      dialog
      ycmd

      ## Web
      csslint
      #nodejs

      # Misc
      ## Emulators
      wine

      # OS-Specific
      ## Linux
      iotop
      powertop
      psmisc
      #linuxPackages.wireguard

      # Servers
      #clamsmtp
      #quagga

      # Tools
      ## Archivers
      unrar
      unzip
      zip

      ## Filesystems
      android-file-transfer

      ## Graphics
      pywal
      scrot    # OR escrotum OR maim OR yaxg

      ## Misc
      neofetch
      vdirsyncer # for khal and khard
      youtube-dl
      yubikey-personalization

      ## Networking
      #aircrack-ng
      #offlineimap
      #traceroute
      #wget
      #whois
      
      ## Security
      #clamav
      #john
      #metasploit
      #nmap
      pass
      #thc-hydra

      ## System
      htop
      lshw
      ps_mem
      tree

      ## Text
      ripgrep

      ## X11
      arandr

      # Top-level
      ## Python-packages
      python36Packages.glances
    ];
  };
}
