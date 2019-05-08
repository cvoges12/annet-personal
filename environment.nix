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
      #cava
      caudec
      ncmpcpp

      ## Editors
      vim
      (import ./nvim.nix)

      ## Graphics
      feh

      ## Misc
      calcurse
      dmenu
      khard
      mpvc
      #ranger
      rxvt_unicode
      zathura
      
      ## Networking
      ### Browsers
      firefox
      surf

      ### Feedreaders
      #newsboat

      ### IDS
      #snort

      ### Instant-Messengers
      #profanity
      #quaternion
      #riot-web
      #signal-desktop
      tdesktop
      #telegram-cli
      
      ### IRC
      #weechat

      ### Mailreaders
      #mailsync  # maybe checkout too?
      #neomutt
      #notmuch # maybe check out `notmuch-mutt`
      
      ### Sniffers
      #wireshark

      ## Video
      mpv

      ## Window-Manager
      i3-gaps
      i3blocks-gaps
      i3lock
      i3status

      # Build-Support
      ## CC-Wrapper
      #clang
      #gcc

      ## Trivial-Builder
      idris
      #libreoffice
      texlive.combined.scheme-full
      #vimPlugins.pluginnames2nix  # use this in the future

      # Development
      ## Compilers
      ghc
      #llvm
      openjdk

      ## Haskell-Modules
      ### Hackage-Packages
      #haskellPackages.Chart
      haskell.packages.ghc822.djinn
      haskellPackages.ghcid
      haskellPackages.hledger
      #haskellPackages.hnix
      haskellPackages.pandoc
      #haskellPackages.purescript
      haskellPackages.shelly
      haskellPackages.stack

      ## Interpreters
      #python37Full

      ## Libraries
      gnutls
      libnotify

      ## Tools
      ### Misc
      dialog

      ## Web
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

      # X11
      arandr

      # Top-level
      ## Python-packages
      python36Packages.glances
    ];
  };
}
