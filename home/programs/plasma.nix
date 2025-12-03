{ pkgs, lib, ... }: {

  programs.plasma = {
    enable = true;
    overrideConfig = true;

    workspace = {

      # Appearance & Style -> Colors & Themes -> Global Theme
      # (plasma-apply-lookandfeel --list)
      lookAndFeel = "Catppuccin-Frappe-Blue";

      # Appearance & Style -> Wallpaper
      # wallpaper = ../../wallpapers/walls-catppuccin-mocha/river-city.jpg;

    };

    # Deskotp Context Menu -> Desktop and Wallpaper -> Mouse Actions
    /* desktop.mouseActions = {
      rightClick = "contextMenu";
      middleClick = "switchWindow";
    }; */

    # Input & Output -> Mouse & Touchpad -> Touchpad
    input.touchpads = [
      {
        # Thinkpad T14 Gen 1
        enable = true;
        name = "SynPS/2 Synaptics TouchPad";
        vendorId = "0002";
        productId = "0007";
        
        # accelerationProfile = "none";
        disableWhileTyping = true;
        leftHanded = true;
        middleButtonEmulation = true;
        pointerSpeed = 0;
        naturalScroll = true;
        tapToClick = true;
      }
    ];

    # System -> Autostart
    startup.startupScript."autostart" = {
      text = ''
        mullvad-vpn &
        plasma-apply-wallpaperimage $HOME/nix/wallpapers/walls-catppuccin-mocha/river-city.jpg &
        signal-desktop &
        discord &
        qdbus org.kde.kglobalaccel /component/kwin invokeShortcut "Switch to Desktop 5" &
      '';
      runAlways = true;
    };

    # Panels
    # check ~/.config/plasma-org.kde.plasma.desktop-appletsrc or /run/current-system/sw/share/plasma/plasmoids/ for values
    panels = [

      {
        floating = true;
        height = 34;
        hiding = "dodgewindows";
        screen = "all";
        location = "bottom";
      }

      # Top left
      /* {
        alignment = "left";
        lengthMode = "fit";
        floating = true;
        height = 180;
        hiding = "dodgewindows";
        location = "top";
        widgets = [
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          {
            name = "org.kde.plasma.systemmonitor.net";
            config = {
              Appearance = {
                chartFace="org.kde.ksysguard.linechart";
              };
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          {
            name = "org.kde.plasma.systemmonitor.cpu";
            config = {
              Appearance = {
                chartFace="org.kde.ksysguard.facegrid";
              };
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
        ];
        screen = "all";
      }

      # Top right
      {
        alignment = "right";
        lengthMode = "fit";
        floating = true;
        height = 180;
        hiding = "dodgewindows";
        location = "top";
        widgets = [
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          {
            name = "org.kde.plasma.systemmonitor.memory";
            config = {
              Appearance = {
                chartFace="org.kde.ksysguard.facegrid";
              };
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          {
            name = "org.kde.plasma.systemmonitor.diskactivity";
            config = {
              Appearance = {
                chartFace="org.kde.ksysguard.linechart";
              };
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
        ];
        screen = "all";
      }

      # Top center
      {
        alignment = "center";
        lengthMode = "fit";
        floating = true;
        height = 40;
        hiding = "dodgewindows";
        location = "top";
        widgets = [
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma_applet_dict"
          "org.kde.plasma.colorpicker"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          {
            name = "org.kde.plasma.icontasks";
            config.General.launchers = [
              "applications:org.kde.konsole.desktop"
              "applications:org.kde.dolphin.desktop"
              "applications:librewolf.desktop"
              "applications:code.desktop"
            ];
            config.General.showOnlyCurrentDesktop = "false";
          }
        ];
        screen = "all";
      }

      # Bottom center behind
      {
        alignment = "center";
        lengthMode = "fit";
        floating = true;
        height = 34;
        hiding = "dodgewindows";
        location = "bottom";
        widgets = [
          "org.kde.plasma.kickoff"
        ];
        screen = "all";
      }

      # Bottom center
      {
        alignment = "center";
        lengthMode = "fit";
        floating = true;
        height = 34;
        hiding = "dodgewindows";
        location = "bottom";
        widgets = [
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          {
            name = "org.kde.plasma.systemmonitor.net";
            config = {
              Appearance = {
                chartFace="org.kde.ksysguard.facegrid";
              };
            };
          }
          {
            name = "org.kde.plasma.systemmonitor.net";
            config = {
              Appearance = {
                chartFace="org.kde.ksysguard.piechart";
              };
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          {
            name = "org.kde.plasma.systemmonitor.cpu";
            config = {
              Appearance = {
                chartFace="org.kde.ksysguard.facegrid";
              };
            };
          }
          "org.kde.plasma.systemmonitor.cpu"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemmonitor.cpucore"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemmonitor.memory"
          {
            name = "org.kde.plasma.systemmonitor.memory";
            config = {
              Appearance = {
                chartFace="org.kde.ksysguard.facegrid";
              };
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          {
            name = "org.kde.plasma.systemmonitor.diskactivity";
            config = {
              Appearance = {
                chartFace="org.kde.ksysguard.piechart";
              };
            };
          }
          {
            name = "org.kde.plasma.systemmonitor.diskactivity";
            config = {
              Appearance = {
                chartFace="org.kde.ksysguard.facegrid";
              };
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
        ];
        screen = "all";
      }

      # Bottom left
      {
        alignment = "left";
        lengthMode = "fit";
        floating = true;
        height = 34;
        hiding = "dodgewindows";
        location = "bottom";
        widgets = [
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.digitalclock"
          {
            name = "org.kde.plasma.weather";
            config = {
              pressureUnit=5008;
              speedUnit=9000;
              temperatureUnit=6001;
              visibilityUnit=2007;
              WeatherStation.source = "dwd|weather|Stuttgart-Echt.|10738";
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          {
            name = "org.kde.plasma.digitalclock";
            config = {
              Appearance = {
                selectedTimeZones = "America/New_York";
              };
            };
          }
          {
            name = "org.kde.plasma.weather";
            config = {
              pressureUnit=5008;
              speedUnit=9000;
              temperatureUnit=6001;
              visibilityUnit=2007;
              WeatherStation.source = "noaa|weather|College Park Airport, MD";
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.timer"
        ];
        screen = "all";
      }

      # Bottom right
      {
        alignment = "right";
        lengthMode = "fit";
        floating = true;
        height = 34;
        hiding = "dodgewindows";
        location = "bottom";
        widgets = [
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          {
            systemTray.items = {
              shown = [ ];
              hidden = [
                "org.kde.plasma.clipboard"
                "org.kde.plasma.brightness"
              ];
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.pager"
          "org.kde.plasma.marginsseparator"
        ];
        screen = "all";
      } */


      # Trying out stuff
      # Left bottom
      /* {
        alignment = "right";
        lengthMode = "custom";
        maxLength = 1000;
        minLength = 0;
        offset = 43;
        floating = true;
        height = 160;
        hiding = "dodgewindows";
        location = "left";
        widgets = [
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.analogclock"
        ];
        screen = "all";
      } */
      # Right bottom
      /* {
        alignment = "right";
        lengthMode = "custom";
        maxLength = 1000;
        minLength = 0;
        offset = 43;
        floating = true;
        height = 160;
        hiding = "dodgewindows";
        location = "right";
        widgets = [
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.mediacontroller"
        ];
        screen = "all";
      } */
   /* {
        floating = true;
        height = 34;
        hiding = "dodgewindows";
        location = "top";
        widgets = [
          "org.kde.plasma.kickoff"
        ];
        screen = "all";
      }
      {
        floating = true;
        height = 34;
        hiding = "dodgewindows";
        location = "top";
        widgets = [
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.pager"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.digitalclock"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.mediacontroller"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.systemmonitor.cpu"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemmonitor.cpucore"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemmonitor.memory"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.marginsseparator"
        ];
        screen = "all";
      } */
      /* {
        alignment = "left";
        lengthMode = "custom";
        maxLength = 1000;
        minLength = 0;
        offset = 52;
        floating = true;
        height = 34;
        hiding = "dodgewindows";
        location = "top";
        widgets = [
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.pager"
        ];
        screen = "all";
      }
      {
        alignment = "left";
        lengthMode = "custom";
        maxLength = 1000;
        minLength = 0;
        offset = 129;
        floating = true;
        height = 34;
        hiding = "dodgewindows";
        location = "top";
        widgets = [
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.mediacontroller"
        ];
        screen = "all";
      } */
      /* {
        alignment = "right";
        lengthMode = "custom";
        maxLength = 1000;
        minLength = 0;
        offset = 1057;
        floating = true;
        height = 34;
        hiding = "dodgewindows";
        location = "top";
        widgets = [
          "org.kde.plasma.weather"
        ];
        screen = 1;
      } */
      /* {
        alignment = "left";
        lengthMode = "custom";
        maxLength = 1000;
        minLength = 0;
        offset = 1057;
        floating = true;
        height = 34;
        hiding = "dodgewindows";
        location = "top";
        widgets = [
          "org.kde.plasma.windowlist"
        ];
        screen = 1;
      } */
      /* {
        alignment = "right";
        lengthMode = "custom";
        maxLength = 1000;
        minLength = 0;
        offset = 84;
        floating = true;
        height = 34;
        hiding = "dodgewindows";
        location = "top";
        widgets = [
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
        ];
        screen = "all";
      } */
    ];

    # Input & Output -> Keyboard -> Shortcuts
    shortcuts = {
      kwin = {
        "KrohnkiteTileLayout" = [ ]; # Default: Meta+T
        "Edit Tiles" = [ ]; # Default : Meta+T
        "Window Close" = [
          "Alt+F4"
          "Meta+Shift+Q"
        ]; # Default = Alt+F4
        "Switch to Desktop 1" = "Meta+1"; # Default: Ctrl+F1
        "Switch to Desktop 2" = "Meta+2"; # Default: Ctrl+F2
        "Switch to Desktop 3" = "Meta+3"; # Default: Ctrl+F3
        "Switch to Desktop 4" = "Meta+4"; # Default: Ctrl+F4
        "Switch to Desktop 5" = "Meta+5"; # Default: Ctrl+F5
        "Switch to Desktop 6" = "Meta+6"; # Default: Ctrl+F6
        "Switch to Desktop 7" = "Meta+7"; # Default: Ctrl+F7
        "Switch to Desktop 8" = "Meta+8"; # Default: Ctrl+F8
        "Switch to Desktop 9" = "Meta+9"; # Default: Ctrl+F9
        "Window to Desktop 1" = "Meta+!"; # Default: Meta+Ctrl+1
        "Window to Desktop 2" = "Meta+\""; # Default: Meta+Ctrl+2
        "Window to Desktop 3" = "Meta+§"; # Default: Meta+Ctrl+3
        "Window to Desktop 4" = "Meta+$"; # Default: Meta+Ctrl+4
        "Window to Desktop 5" = "Meta+%"; # Default: Meta+Ctrl+5
        "Window to Desktop 6" = "Meta+&"; # Default: Meta+Ctrl+6
        "Window to Desktop 7" = "Meta+/"; # Default: Meta+Ctrl+7
        "Window to Desktop 8" = "Meta+("; # Default: Meta+Ctrl+8
        "Window to Desktop 9" = "Meta+)"; # Default: Meta+Ctrl+9
        "Window Quick Tile Bottom" = [ ]; # Default: Meta+Down
        "Window Quick Tile Top" = [ ]; # Default: Meta+Up
        "Window Quick Tile Left" = [ ]; # Default: Meta+Left
        "Window Quick Tile Right" = [ ]; # Default: Meta+Right
        "Switch One Desktop Down" = "Meta+Down"; # Default: Meta+Ctrl+Down
        "Switch One Desktop Up" = "Meta+Up"; # Default: Meta+Ctrl+Up
        "Switch One Desktop to the Left" = "Meta+Left"; # Default: Meta+Ctrl+Left
        "Switch One Desktop to the Right" = "Meta+Right"; # Default: Meta+Ctrl+Right
        "Window One Desktop Down" = "Meta+Shift+Down"; # Default: Meta+Ctrl+Shift+Down
        "Window One Desktop Up" = "Meta+Shift+Up"; # Default: Meta+Ctrl+Shift+Up
        "Window One Desktop to the Left" = "Meta+Shift+Left"; # Default: Meta+Ctrl+Shift+Left
        "Window One Desktop to the Right" = "Meta+Shift+Right"; # Default: Meta+Ctrl+Shift+Right
        "MoveMouseToFocus" = "Meta+Alt+PgDown"; # Default: Meta+F5
        "Window to Next Screen" = [ ]; #Default: Meta+Shift+Right
        "Window to Previous Screen" = [ ]; # Default: Meta+Shift+Left
        # "KrohnkiteFocusRight" = ",none,Krohnkite: Focus Right"; Default 
        /* "Switch Window Down" = [ ]; # Default: Meta+Alt+Down
        "Switch Window Left" = [ ]; # Default: Meta+Alt+Left
        "Switch Window Right" = [ ]; # Default: Meta+Alt+Right
        "Switch Window Up" = [ ]; # Default: Meta+Alt+Up */
      };
      ksmserver = {
        "Lock Session" = "Screensaver"; # Default: Meta+L, Screensaver
      };
      plasmashell = {
        "activate task manager entry 1" = [ ]; # Default: Meta+1
        "activate task manager entry 2" = [ ]; # Default: Meta+2
        "activate task manager entry 3" = [ ]; # Default: Meta+3
        "activate task manager entry 4" = [ ]; # Default: Meta+4
        "activate task manager entry 5" = [ ]; # Default: Meta+5
        "activate task manager entry 6" = [ ]; # Default: Meta+6
        "activate task manager entry 7" = [ ]; # Default: Meta+7
        "activate task manager entry 8" = [ ]; # Default: Meta+8
        "activate task manager entry 9" = [ ]; # Default: Meta+9
      };

      # Input & Output -> Keyboard -> Shortcuts -> Add New
      # "services/foot.desktop"."_launch" = "Meta+T";

      # Input & Output -> Keyboard -> Shortcuts -> Applications -> Konsole
      "services/org.kde.konsole.desktop"."_launch" = "Meta+T"; # Default: Ctrl+Alt+T
    };

    # System -> Session -> Desdktop Session
    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";

    # Input & Output -> Keyboard -> Shortcuts -> Add New
    /* hotkeys.commands = {
      "switch-window-down" = {
        name = "Switch Window Down";
        key = "Meta+Alt+Down";
        command = "bash ${./plasma_helpers/switch_window.sh} Down";
      };
      "switch-window-up" = {
        name = "Switch Window Up";
        key = "Meta+Alt+Up";
        command = "bash ${./plasma_helpers/switch_window.sh} Up";
      };
      "switch-window-left" = {
        name = "Switch Window Left";
        key = "Meta+Alt+Left";
        command = "bash ${./plasma_helpers/switch_window.sh} Left";
      };
      "switch-window-right" = {
        name = "Switch Window Right";
        key = "Meta+Alt+Right";
        command = "bash ${./plasma_helpers/switch_window.sh} Right";
      };
    }; */

    # Apps & Windows -> Window Management -> Virtual Desktops
    kwin.virtualDesktops = {
      number = 9;
      rows = 3;
    };

    # Security & Privacy -> Screen Locking
    kscreenlocker = {
      lockOnResume = true;
      timeout = 15;
      appearance.wallpaper = ../../wallpapers/river-city.jpg;
    };

    # Apps & Windows -> Window Management -> Window Rules
    window-rules = [
      {
        description = "Set minimum geometry size";
        match = {
          window-types = [ "normal" ];
        };
        apply = {
          minsize = {
            apply = "force";
            value = "0,0";
          };
        };
      }
      {
        description = "Disable decorations";
        match = {
          window-types = [ "normal" ];
        };
        apply = {
          noborder = {
            value = true;
            apply = "force";
          };
        };
      }
    ];

    configFile = {

      # Apps & Windows -> Window Management -> Window Behavior
      "kwinrc"."Windows"."DelayFocusInterval" = 100;
      "kwinrc"."Windows"."FocusPolicy" = "FocusFollowsMouse";
      "kwinrc"."Windows"."NextFocusPrefersMouse" = true;

      # Apps & Windows -> Window Management -> KWin Scripts -> Krohnkite
      "kwinrc"."Plugins"."krohnkiteEnabled" = true;
      "kwinrc"."Script-krohnkite"."screenGapBetween" = 8;
      "kwinrc"."Script-krohnkite"."screenGapBottom" = 8;
      "kwinrc"."Script-krohnkite"."screenGapLeft" = 8;
      "kwinrc"."Script-krohnkite"."screenGapRight" = 8;
      "kwinrc"."Script-krohnkite"."screenGapTop" = 8;
      "kwinrc"."Script-krohnkite"."screenDefaultLayout" = "DP-1:stackedlayout,DP-3:stackedlayout,HDMI-A-1:stackedlayout ,:quarterlayout";

      # Apps & Windows -> Window Management -> Desdktop Effects -> Geometry Change
      "kwinrc"."Plugins"."kwin4_effect_geometry_changeEnabled" = true;

      # Apps & Windows -> Window Management -> Desdktop Effects -> Rounded Corners
      "kwinrc"."Round-Corners"."ActiveOutlineAlpha" = 255;
      "kwinrc"."Round-Corners"."DisableOutlineTile" = false;
      "kwinrc"."Round-Corners"."DisableRoundTile" = false;
      "kwinrc"."Round-Corners"."InactiveOutlineAlpha" = 255;
      "kwinrc"."Round-Corners"."InactiveOutlineColor" = "46,50,68";
      "kwinrc"."Round-Corners"."InactiveOutlineThickness" = 2.5;
      "kwinrc"."Round-Corners"."InactiveSecondOutlineColor" = "32,34,51";
      "kwinrc"."Round-Corners"."InactiveSecondOutlineThickness" = 3;
      "kwinrc"."Round-Corners"."OutlineColor" = "155,121,177";
      "kwinrc"."Round-Corners"."OutlineThickness" = 2.5;
      "kwinrc"."Round-Corners"."SecondOutlineColor" = "32,34,51";
      "kwinrc"."Round-Corners"."SecondOutlineThickness" = 3;

      # Apps & Windows -> Default Applications -> Default Applications
      "mimeapps.list"."Added Associations"."x-scheme-handler/http" = "zen-browser.desktop";
      "mimeapps.list"."Added Associations"."x-scheme-handler/https" = "zen-browser.desktop";
      "mimeapps.list"."Default Applications"."x-scheme-handler/http" = "zen-browser.desktop";
      "mimeapps.list"."Default Applications"."x-scheme-handler/https" = "zen-browser.desktop";
      # "kdeglobals"."General"."TerminalApplication" = "foot";
      # "kdeglobals"."General"."TerminalService" = "foot.desktop";

      # Dolphin -> Configure Dolphin... -> Interface -> Previews
      "kdeglobals"."PreviewSettings"."EnableRemoteFolderThumbnail" = true;
      "kdeglobals"."PreviewSettings"."MaximumRemoteSize" = 1048576000;

      # Disable browser integration reminder
      "kded5rc"."Module-browserintegrationreminder"."autoload" = false;

      # Apps & Windows -> Notifications
      "plasmanotifyrc"."Notifications"."PopupPosition" = "BottomRight";

      # Input % Output -> Sound Configure Volume Controls
      "plasmaparc"."General"."RaiseMaximumVolume" = true;
      
    };

  };

  # Manually add plugins
  home.file.".local/share/kwin/effects" = {
    source = ./plasma_extra_packages/geometry_change;
    recursive = true;
  };
  
}
