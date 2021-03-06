{ config, pkgs, lib, ... }:

{ home-manager.users.cvoges12 = let
    name = "Clayton Voges";
    gmail = "vogesclayton@gmail.com";
    vmail = "cvoges@vojes.co";
    phone = "+1 (314) 585-1594";
    user = "cvoges12";
    home = "/home/${user}";
    projects = "${home}/Projects";
    mailDir = "${home}/Mail";
    musicDir = "${home}/Music";
    picDir = "${home}/Pictures";
    bg = "${picDir}/wallpapers";
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
          # imap = {
          #   host = "gmail.com";
          #   port = "993";
          #   tls = {
          #     enable = true;
          #     certificatesFile = "config.accounts.email.certificatesFile";
          #     useStartTls = false;
          #   };
          # };
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
          # smtp = {
          #   host = "gmail.com";
          #   port = "465";
          #   tls = {
          #     enable = true;
          #     certificatesFile = "config.accounts.email.certificatesFile";
          #     useStartTls = false;
          #   };
          # };
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
    # packages = with pkgs; [
    # ];
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
    # firefox = {
    #   enable = true;
    #   enableAdobeFlash = false;
    #   extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    #     https-everywhere
    #     privacy-badger
    #   ];
    #   profiles = {
    #     default = {
    #       isDefault = true;
    #       settings = {
    #         "browser.bookmarks.showMobileBookmarks" = true;
    #         "browser.search.hiddenOneOffs" = 
    #           "Google,Yahoo,Bing,Amazon.com,Twitter";
    #         "browser.search.suggest.enabled" = true;
    #         "browser.startup.homepage" = "https://startpage.com/";
    #         "network.allow-experiments" = false;
    #       };
    #     };
    #   };
    # };
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
        shadowOtherUsers = false;
        showProgramPath = true;
        showThreadNames = false;
        sortDescending = true;
        sortKey = "PERCENT_CPU";
        treeView = true;
        updateProcessNames = true;
      };
      info.enable = true;
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
      };
      zathura = {
        enable = true;
        extraConfig = "";
        options = { };
      };
      zsh = {
        enable = true;
        enableAutosuggestions = true;
        enableCompletion = true;
      # defaultKeymap = "vicmd"; # still need to change keys
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
        #sessionVariables = {};
        shellAliases = {
          cal = "calcurse";
          wttr = "curl 'https://wttr.in/?m&M&F&A&Q'";

          "." = "pwd && ls";
          common = "cd ${projects}/Annet/annet-common";
          personal = "cd ${projects}/Annet/annet-personal";
          foep = "cd ${projects}/FOEP";

          home = "personal && nvim home.nix";
          envir = "personal && nvim environment.nix";

          add = "git add -p";
          commit = "git commit";
          push = "git push github && git push gitlab";

          hs = "hsid && hsrepl";
          hsid = "kitty ghcid --command \"stack repl\" --test \":main\"";
          hsrepl = "kitty stack repl";

          discord = "brave discordapp.com/channels/@me";
          riot = "brave riot.im/app";
          telegram = "brave web.telegram.org";
          tgcli = "telegram-cli -fN";

          wa = "wal -i";
          art = "wa ${bg}/Art";
          city = "wa ${bg}/Cityscapes";
          etc = "wa ${bg}/Etc";
          future = "wa ${bg}/Future";
          land = "wa ${bg}/Landscapes";
          space = "wa ${bg}/Spacescapes";
          tech = "wa ${bg}/Tech";
          titans = "wa ${bg}/Titans";
          unsorted = "wa ${bg}/Unsorted";
          vibrant = "wa ${bg}/Vibrant";
        };
      };
    };
    services = {
      gpg-agent = {
        enable = true;
        enableSshSupport = true;
        defaultCacheTtl = 1800;
      };
      imapnotify.enable = true;
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
          mpdSupport = true;
          pulseSupport = true;
        };
        config = let
          bar = {
            monitor-strict = true;

            width = "100%";
            height = "3%";
            radius = 0;
            line-size = 2;
            padding = 2;

            background = "\${colors.background}";
            foreground = "\${colors.foreground}";

            font-0 = "Fira Mono:pixelsize=10;0";
            font-1 = "FontAwesome5Free:pixelsize=10;0";
            font-2 = "FontAwesome5Free:style=Solid:pixelsize=10;0";
            font-3 = "WenQuanYi Zen Hei:pixelsize=10;0";

            fixed-center = true;
            module-margin-left = 2;
            module-margin-right = 2;
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
            modules-right = "volume light date";
          };
        in
        { "colors" = {
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
            blacklist-1 = "scroll lock";
            format = "<label-layout> <label-indicator>";
            format-spacing = 0;
            label-layout = "%name%";
            label-indicator = "%name%";
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
            type = "internal/backlight";
            card = "intel_backlight";
            interval = 5;
            output = "LVDS-1";
            enable-scroll = true;
            format = "<label>";
            label = " %percentage%%";
          };

          "module/volume" = {
            type = "internal/pulseaudio";
            sink = "alsa_output.pci-0000_00_1b.0.analog-stereo";
            use-ui-max = "true";
            interval = 5;
            format-volume = "<ramp-volume> <label-volume>";
            format-muted = "<label-muted>";
            label-volume = "%percentage%%";
            label-volume-foreground = "#ff";
            label-muted = " %percentage%%";
            label-muted-foreground = "#66";
            ramp-volume-0 = "";
            ramp-volume-1 = "";
            ramp-volume-2 = "";
            master-soundcard = "default";
            speaker-soundcard = "default";
            headphone-soundcard = "default";
            master-mixer = "Master";
            speaker-mixer = "Speaker";
            headphone-mixer = "Headphone";
          };

          "module/memory" = {
            type = "internal/memory";
            interval = 10;
            format = "<label>";
            label = " %percentage_used%%";
          };

          "module/cpu" = {
            type = "internal/cpu";
            interval = 10;
            format = "<label>";
            label = " %percentage%%";
          };

          "module/battery" = {
            type = "internal/battery";
            full-at = 99;
            battery = "BAT0";
            adapter = "AC";
            poll-interval = 10;

            format-full = "<label-full>";
            format-charging = "<label-charging>";
            format-discharging = "<ramp-capacity> <label-discharging>";
            label-full = " %percentage%%";
            label-charging = " %percentage%%";
            label-discharging = "%percentage%%";

            ramp-capacity-0 = "";
            ramp-capacity-1 = "";
            ramp-capacity-2 = "";
            ramp-capacity-3 = "";
            ramp-capacity-4 = "";
          };

          "module/temp" = {
            type = "internal/temperature";
            interval = 10;
            thermal-zone = 0;
            hwmon-path = "/sys/devices/platform/coretemp.0/hwmon/hwmon2/temp1_input";
          };

          "module/mpd" = {
            type = "internal/mpd";
            host = "127.0.0.1";
            port = 6600;
            password = "";
            interval = 5;

            format-online = "<label-time> <label-song>";
            format-offline = "<label-offline>";
            format-playing = "<icon-play> <label-time> <label-song>";
            format-paused = "<icon-pause> <label-time> <label-song>";
            format-stopped = "<icon-stop> <label-time> <label-song>";
            label-song = "%title%";
            label-offline = "offline";
            label-time = "[%elapsed%/%total%]";

            icon-play = "";
            icon-pause = "";
            icon-stop = "";
            icon-prev = "";
            icon-next = "";
            icon-seekb = "";
            icon-seekf = "";
            icon-random = "";
            icon-repeat = "";
            icon-repeatone = "";
            icon-single = "";
            icon-consume = "";
          };
        };
        script = ''
          polybar top0 &
          polybar bottom0 &
          polybar top1 &
          polybar bottom1 &
        '';
      };
    # redshift = {
    #   enable = true;
    #   package = pkgs.redshift;
    # # brightness = {
    # #   day = "1";
    # #   night = "1";
    # # };
    #   latitude = "38.6";
    #   longitude = "90.5";
    #   provider = "manual";
    #   temperature = {
    #     day = 3500;
    #     night = 5500;
    #   };
    # };
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
          "${mod}+Return" = "exec kitty";

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
            "h" = "resize shrink width 5 px or 5 ppt";
            "n" = "resize grow height 5 px or 5 ppt";
            "e" = "resize shrink height 5 px or 5 ppt";
            "i" = "resize grow width 5 px or 5 ppt";

            # Qwerty
            #"h" = "resize shrink width 5 px or 5 ppt";
            #"j" = "resize grow height 5 px or 5 ppt";
            #"k" = "resize shrink height 5 px or 5 ppt";
            #"l" = "resize grow width 5 px or 5 ppt";

            "Escape" = "mode default";
          };
        };
        startup = [
          { command = "etc";
            always = true;
            notification = false; }
          { command = "systemctl --user restart polybar.service"; 
            always = true; 
            notification = false; }
        ];
        window = {
          border = 5;
        };
      };
    };
  };
}
