{ config, pkgs, lib, ... }:

{ home-manager.users.cvoges12 = let
    name = "Clayton Voges";
    gmail = "vogesclayton@gmail.com";
    vmail = "cvoges@vojes.co";
    phone = "+1 (314) 585-1594";
    user = "cvoges12";
    home = "/home/${user}";
    mailDir = "${home}/Mail";
    musicDir = "${home}/Music";
    mod = "Mod4";
    ws0 = "workspace 0";
    ws1 = "workspace 1";
    ws2 = "workspace 2";
    ws3 = "workspace 3";
    ws4 = "workspace 4";
    ws5 = "workspace 5";
    ws6 = "workspace 6";
    ws7 = "workspace 7";
    ws8 = "workspace 8";
    ws9 = "workspace 9";
    ws10 = "workspace 10";
  in
  { accounts = {
      email = {
        accounts = {
          "${gmail}" = {
            address = "${gmail}";
            flavor = "gmail.com";
            folders = {
              drafts = "Drafts";
              inbox = "Inbox";
              sent = "Sent";
              trash = "Trash";
            };
            gpg = {
              encryptByDefault = false;
              key = "";
              signByDefault = false;
            };
            imap = {
              host = "gmail.com";
              port = "993";
              tls = {
                enable = true;
                certificatesFile = "config.accounts.email.certificatesFile";
                useStartTls = false;
              };
            };
            notmuch.enable = true;
            offlineimap = {
              enable = true;
            };
            passwordCommand = "pass Website/google.com";
            primary = true;
            realName = "${name}";
            signature = {
              showSignature = "append";
              text = ''
                ---
                ${name}
                ${gmail}
                ${phone}
              '';
            };
            smtp = {
              host = "gmail.com";
              port = "465";
              tls = {
                enable = true;
                certificatesFile = "config.accounts.email.certificatesFile";
                useStartTls = false;
              };
            };
            userName = "${gmail}";
          };
        # "${vmail}" = {
        #   address  = "${vmail}";
        #   flavor = "plain";
        #   primary = false;
        #   realName = "${name}";
        #   userName = "${vmail}";
        #   passwordCommand = "pass Website/vojes.co";
        # };
        };
        certificatesFile = "/etc/ssl/certs/ca-certificates.crt";
        maildirBasePath = "${mailDir}";
      };
    };
    home = {
    # keyboard = {
    #   layout = "us";
    #   variant = "colemak";
    # };
      packages = with pkgs; [
      ];
      sessionVariables = {
        EDITOR = "nvim";
      };
      #username = "${user}";
    };
    programs = {
      bash.enable = false;
      bat = {
        enable = true;
        config = { pager = "less -FR"; theme = "TwoDark"; };
      };
      browserpass = {
        enable = true;
        browsers = [ "firefox" ];
      };
      feh = {
        enable = true;
        keybindings = { zoom_in = "plus"; zoom_out = "minus"; };
      };
      git = {
        enable = true;
        userEmail = "${gmail}";
        userName = "${user}";
      };
      firefox = {
        enable = true;
        enableAdobeFlash = false;
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          https-everywhere
          privacy-badger
        ];
        package = "pkgs.firefox";
        profiles = {
          default = {
            isDefault = true;
            settings = {
              "browser.bookmarks.showMobileBookmarks" = true;
              "browser.search.hiddenOneOffs" = 
                "Google,Yahoo,Bing,Amazon.com,Twitter";
              "browser.search.suggest.enabled" = true;
              "browser.startup.homepage" = "https://startpage.com/";
              "network.allow-experiments" = false;
            };
          };
        };
      };
      htop = {
        enable = true;
        cpuCountFromZero = true;
        delay = 15;
        detailedCpuTime = true;
        fields = [
          "PID"
          "USER"
          "PRIORITY"
          "NICE"
          "M_SIZE"
          "M_RESIDENT"
          "M_SHARE"
          "STATE"
          "PERCENT_CPU"
          "PERCENT_MEM"
          "TIME"
          "COMM" 
        ];
        headerMargin = true;
        hideKernelThreads = true;
        hideUserlandThreads = false;
        highlightBaseName = true;
        highlightMegabytes = true;
        highlightThreads = true;
        meters = {
          left = [ "AllCPUs" "Memory" "Swap" ];
          right = [ "Tasks" "LoadAverage" "Uptime" ];
        };
        showOtherUsers = false;
        showProgramPath = true;
        showThreadNames = false;
        sortDescending = true;
        sortKey = "PERCENT_CPU";
        treeView = true;
        updateProcessNames = true;
      };
      info = true;
      mpv = {
        enable = true;
        bindings = {
          WHEEL_UP = "seek 10";
          WHEEL_DOWN = "seek -10";
          "Alt+0" = "set window-scale 0.5";
        };
        config = {
          profile = "gpu-hq";
          force-window = "yes";
          ytdl-format = "bestvideo+bestaudio";
          cache-default = 4000000;
        };
      };
      newsboat = {
        enable = true;
        autoReload = true;
      };
      notmuch = {
        enable = true;
        extraConfig = {
        };
        hooks = {
          postInsert = "";
          postNew = "";
          preNew = "";
        };
        maildir.synchronizeFlags = true;
        new = {
          ignore = [];
          tags = [ "new" "inbox" ];
        };
        search.excludeTags = [ "trash" "spam" ];
      };
      obs-studio = {
        enable = true;
        plugins = with pkgs; [
          obs-linuxbrowser
        ];
      };
      offlineimap = {
        enable = true;
        extraConfig = {
          default = {
          };
          general = {
          };
        };
        pythonFile = ''
        '';
      };
      ssh = {
        enable = true;
      };
      texlive = {
        enable = true;
        extraPackages = "tpkgs: { inherit (tpkgs) collection-fontsrecommended algorithms; }";
      };
      urxvt = {
        enable = true;
        extraConfig = {
          #sharding = 15;
        };
        fonts = [
          "xft:Fira Mono:size=10"
        ];
        keybindings = {
          "Shift-Control-C" = "eval:selection_to_clipboard";
          "Shift-Control-V" = "eval:paste_clipboard";
        };
        iso14755 = true;
        package = pkgs.rxvt_unicode;
        scroll = {
          bar.enable = false;
          keepPosition = true;
          lines = 10000;
          scrollOnKeystroke = true;
          scrollOnOutput = false;
        };
        shading = 75;
        transparent = true;
      };
      zsh = {
        enable = true;
        enableAutosuggestions = true;
        enableCompletion = true;
        #defaultKeymap = ;
        history = {
          expireDuplicatesFirst = true;
          extended = true;
          ignoreDups = true;
          path = ".histfile";
          save = 10000;
          share = true;
        };
        initExtra = "";
        profileExtra = "";
        loginExtra = "";
        logoutExtra = "";
        #localVariables
        #sessionVariables
        shellAliases = {
          gitPush = "git push github && git push gitlab";
          hsauto = "ghcid --command \"stack repl\" --test \":main\"";
          hsrepl = "stack repl";
          wttr = "curl 'https://wttr.in/?m&M&F&A&Q'";
        };
      };
    };
    services = {
      gpg-agent = {
        enable = true;
        enableSshSupport = true;
        defaultCacheTtl = 1800;
      };
      mpd = rec {
        enable = true;
        network = {
          listenAddress = "127.0.0.1";
          port = 6600;
        };
        #dataDir = "${home}/.local/share";
        #dbFile = "${dataDir}/tag_cache";
        musicDirectory = "${musicDir}";
        #playlistDirectory = "${dataDir}/playlists";
      };
      polybar = {
        enable = true;
        package = pkgs.polybar.override {
          i3GapsSupport = true;
          alsaSupport = true;
          iwSupport = false; # causes error when true
          githubSupport = true;
        };
        config = let
          bar = {
            monitor-strict = true;

            width = "100%";
            height = "3%";
            radius = 0;

            background = "\${colors.background}";
            foreground = "\${colors.foreground}";
            line-size = 2;

            font-0 = "Fira Mono:pixelsize=10;0";
            font-1 = "FontAwesome5Free:pixelsize=10;0";
            font-2 = "FontAwesome5Free:style=Solid:pixelsize=10;0";
            font-3 = "WenQuanYi Zen Hei:pixelsize=10;0";

            fixed-center = true;
            module-margin-left = 2;
            module-margin-right = 2;
            padding = 2;
          };

          top = {
            bottom = false;

            modules-left = "i3";
            modules-right = "cpu memory fs temp battery";
          };

          bottom = {
            bottom = true;

            modules-left = "wired wifi";
            modules-center = "mpd";
            modules-right = "light date";
          };
        in
        {
          "colors" = {
            background = "\${xrdb:color0:#222}";
            foreground = "\${xrdb:color7:#222}";
            foreground-alt = "\${xrdb:color7:#222}";
            primary = "\${xrdb:color1:#222}";
            secondary = "\${xrdb:color2:#222}";
            alert = "\${xrdb:color3:#222}";
          };

          "bar/top0" = top // bar // {
            monitor = "LVDS-1";
          };

          "bar/bottom0" = bottom // bar // {
            monitor = "LVDS-1";
          };

          "bar/top1" = top // bar // {
            monitor = "VGA-1";
          };

          "bar/bottom1" = bottom // bar // {
            monitor = "VGA-1";
          };

          "module/i3" = {
            type = "internal/i3";
            scroll-up = "i3wm-wmnext";
            scroll-down = "i3wm-wmprev";

            ws-icon-0 = "0;零";
            ws-icon-1 = "1;一";
            ws-icon-2 = "2;二";
            ws-icon-3 = "3;三";
            ws-icon-4 = "4;四";
            ws-icon-5 = "5;五";
            ws-icon-6 = "6;六";
            ws-icon-7 = "7;七";
            ws-icon-8 = "8;八";
            ws-icon-9 = "9;九";
            ws-icon-10 = "10;十";

            format = "<label-state> <label-mode>";
            label-mode = "%mode%";

            label-focused = "%icon%";
            label-focused-underline = "\${colors.foreground}";
            label-focused-padding = 1;

            label-unfocused = "%icon%";
            label-unfocused-padding = 1;

            label-visible = "%icon%";
            label-visible-underline = "\${colors.foreground}";
            label-visible-padding = 1;

            label-urgent = "%icon%";
            label-urgent-padding = 1;
          };

          "module/date" = {
            type = "internal/date";
            internal = 1;
            date = "%y-%m-%d";
            date-alt = "%a %y-%m-%d";
            time = "%H:%M";
            time-alt = "%H:%M:%S";
            label = " %date%  %time%";
          };

          "module/wired" = {
            type = "internal/network";
            interface = "enp0s25";
            interval = 5;
          };

          "module/wifi" = {
            type = "internal/network";
            interface = "wlp3s0";
            interval = 5;
            label-connected = " %local_ip%";
          };

          "module/kb" = {
            type = "internal/xkeyboard";
            blacklist-0 = "num lock";
          };

          "module/fs" = {
            type = "internal/fs";
            interval = 5;
            mount-0 = "/";
            fixed-values = true;
            spacing = 2;
            label-mounted = " %free%";
            label-unmounted = " not mounted";
          };

          "module/light" = {
            type = "internal/xbacklight";
            card = "intel_backlight";
            format = "<label>";
            label = "BKL: %percentage%%";
            bar-width = 10;
            bar-indicator = "|";
            bar-indicator-foreground = "#ff";
            bar-indicator-font = 2;
            bar-fill = "-";
            bar-fill-font = 2;
            bar-fill-foreground = "#9f78e1";
            bar-empty = "_";
            bar-empty-font = 2;
            bar-empty-foreground = "555";
          };

          #"module/volume" = {
          #  type = "internal/pulseaudio";
          #  sink = "alsa_output.pci-0000_00_1b.0.analog-stereo";
          #  use-ui-max = "true";
          #  interval = 5;
          #  format-volume = "<ramp-volume> <label-volume>";
          #  format-muted = "<label-muted>";
          #  label-volume = "volume %percentage%%";
          #  label-volume-foreground = "#ff";
          #  label-muted = " muted";
          #  label-muted-foreground = "#66";
          #  ramp-volume-0 = "";
          #  ramp-volume-1 = "";
          #  ramp-volume-2 = "";
          #  master-soundcard = "default";
          #  speaker-soundcard = "default";
          #  headphone-soundcard = "default";
          #  master-mixer = "Master";
          #  speaker-mixer = "Speaker";
          #  headphone-mixer = "Headphone";
          #};

          #"module/alsa" = {
          #  type = "internal/alsa";
          #  master-soundcard = "default";
          #  speaker-soundcard = "default";
          #  headphone-soundcard = "default";
          #  master-mixer = "Master";
          #  speaker-mixer = "Speaker";
          #  headphone-mixer = "Headphone";
          #  headphone-id = 9;
          #  mapped = true;
          #  interval = 5;
          #  format-volume = "<ramp-volume> <label-volume>";
          #  label-volume = "volume %percentage%%";
          #  label-volume-foreground = "#ff";
          #  label-muted = " muted";
          #  label-muted-foreground = "#66";
          #  ramp-volume-0 = "";
          #  ramp-volume-1 = "";
          #  ramp-volume-2 = "";
          #};

          "module/memory" = {
            type = "internal/memory";
            interval = 5;
            format = "<label>";
            label = " %percentage_used%%";
          };

          "module/cpu" = {
            type = "internal/cpu";
            interval = 5;
            format = "<label>";
            label = " %percentage%%";
          };

          "module/battery" = {
            type = "internal/battery";
            label = "Bat %percentage%%";
            full-at = 99;
            battery = "BAT0";
            adapter = "AC";
            poll-interval = 5;
            format-charging = "<label-charging>";
            format-discharging = "<label-discharging>";
            label-charging = " %percentage%%";
            label-discharging = " %percentage%%";
          };

          "module/temp" = {
            type = "internal/temperature";
            interval = 5;
            thermal-zone = 0;
            hwmon-path = "/sys/devices/platform/coretemp.0/hwmon/hwmon2/temp1_input";
          };

          "module/mpd" = {
            type = "internal/mpd";
            host = "127.0.0.1";
            port = 6600;
            password = "password";
            interval = 5;
          };
        };
        script = ''
          polybar top0 &
          polybar bottom0 &
          polybar top1 &
          polybar bottom1 &
        '';
      };
    };
    xsession.windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      config = {
        bars = [];
        modifier = "${mod}";
        floating = {
          modifier = "${mod}";
        };
        gaps = {
          inner = 10;
          outer = 5;
          smartBorders = "on";
          smartGaps = true;
        };
        keybindings = {
          "${mod}+Shift+q" = "exec i3-msg exit";
          "${mod}+Shift+r" = "restart";
          "${mod}+Shift+l" = "exec i3lock";

          "${mod}+d" = "exec --no-startup-id dmenu_run";
          "${mod}+Return" = "exec urxvt";

          "${mod}+w" = "kill";
          "${mod}+f" = "fullscreen toggle";
          "${mod}+r" = "mode resize";
          "${mod}+bar" = "split h";
          "${mod}+minus" = "split v";

          "${mod}+space" = "focus mode_toggle";
          "${mod}+Shift+space" = "floating toggle";
          
          "${mod}+s" = "layout stacking";
          "${mod}+t" = "layout tabbed";
          "${mod}+v" = "layout toggle split";

          "${mod}+p" = "focus parent";
          "${mod}+c" = "focus child";

          # Colemak
          "${mod}+h" = "focus left";
          "${mod}+n" = "focus down";
          "${mod}+e" = "focus up";
          "${mod}+i" = "focus right";
          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+n" = "move down";
          "${mod}+Shift+e" = "move up";
          "${mod}+Shift+i" = "move right";

          # Qwerty
          #"${mod}+h" = "focus left";
          #"${mod}+j" = "focus down";
          #"${mod}+k" = "focus up";
          #"${mod}+l" = "focus right";
          #"${mod}+Shift+h" = "move left";
          #"${mod}+Shift+j" = "move down";
          #"${mod}+Shift+k" = "move up";
          #"${mod}+Shift+l" = "move right";

          # Workspaces
          "${mod}+grave" = "${ws0}";
          "${mod}+1" = "${ws1}";
          "${mod}+2" = "${ws2}";
          "${mod}+3" = "${ws3}";
          "${mod}+4" = "${ws4}";
          "${mod}+5" = "${ws5}";
          "${mod}+6" = "${ws6}";
          "${mod}+7" = "${ws7}";
          "${mod}+8" = "${ws8}";
          "${mod}+9" = "${ws9}";
          "${mod}+0" = "${ws10}";
          "${mod}+Shift+grave" = "move container to ${ws0}";
          "${mod}+Shift+1" = "move container to ${ws1}";
          "${mod}+Shift+2" = "move container to ${ws2}";
          "${mod}+Shift+3" = "move container to ${ws3}";
          "${mod}+Shift+4" = "move container to ${ws4}";
          "${mod}+Shift+5" = "move container to ${ws5}";
          "${mod}+Shift+6" = "move container to ${ws6}";
          "${mod}+Shift+7" = "move container to ${ws7}";
          "${mod}+Shift+8" = "move container to ${ws8}";
          "${mod}+Shift+9" = "move container to ${ws9}";
          "${mod}+Shift+0" = "move container to ${ws10}";

          # Audio/Brightness/Media Controls
          "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume 0 +1%";
          "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume 0 -1%";
          "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute 0 toggle";
          "XF86MonBrightnessUp" = "exec xbacklight -inc 1";
          "XF86MonBrightnessDown" = "exec xbacklight -dec 1";
          "XF86AudioPause" = "exec playerctl pause";
          "XF86AudioNext" = "exec playerctl next";
          "XF86AudioPrev" = "exec playerctl previous";
        };
        modes = {
          resize = {
            # Colemak
            "h" = "resize grow width 10 px or 10 ppt";
            "n" = "resize shrink height 10 px or 10 ppt";
            "e" = "resize grow height 10 px or 10 ppt";
            "i" = "resize shrink width 10 px or 10 ppt";

            # Qwerty
            #"h" = "resize grow width 10 px or 10 ppt";
            #"j" = "resize shrink height 10 px or 10 ppt";
            #"k" = "resize grow height 10 px or 10 ppt";
            #"l" = "resize shrink width 10 px or 10 ppt";

            "Escape" = "mode default";
          };
        };
        startup = [
          { command = "wal -i /home/cvoges12/Pictures/wallpapers/Landscapes";
            always = true;
            notification = false; }
          { command = "systemctl --user restart polybar.service"; 
            always = true; 
            notification = false; }
          { command = "urxvt -hold -e calcurse";
            always = true;
            workspace = "0";
            notification = false; }
        ];
      };
    };
  };
}
