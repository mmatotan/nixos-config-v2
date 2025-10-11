{ config, pkgs, ...}:

{
  home.username = "marko";
  home.homeDirectory = "/home/marko";
  home.stateVersion = "25.05";

  home.pointerCursor = {
    name = "Catppuccin-Macchiato-Green";
    package = pkgs.catppuccin-cursors.macchiatoGreen;
    size = 32;
    hyprcursor = {
      enable = true;
      size = 32;
    };
  };

  programs.wlogout.enable = true;
  programs.hyprlock.enable = true;
  programs.alacritty.enable = true;
  programs.waybar.enable = true;

  catppuccin = {
    enable = true;
    accent = "green";
    flavor = "macchiato";
    wlogout.enable = true;
    hyprlock.enable = true;
    alacritty.enable = true;
    waybar.enable = true;
  };

  programs.bash = {
    enable = true;
  };

  programs.wofi = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "mmatotan";
    userEmail = "mrkanic@gmail.com";
    extraConfig = {
      init.defaultBranch = "master";
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      env = [
      	"HYPRCURSOR_THEME,Catppuccin-Macchiato-Green"
      	"HYPRCURSOR_SIZE,24"
      	"XCURSOR_THEME,Catppuccin-Macchiato-Green"
      	"XCURSOR_SIZE,24"
      ];

      "$mod" = "SUPER";
      exec-once = "hyprlock";
      exec = "hyprpaper";

      monitor = "main, 1920x1080@60.00HHz, 0x0, 1";
      decoration = {
        rounding = "4";
        inactive_opacity = "0.8";
      };
      general = {
        gaps_in = "8";
        gaps_out = "16";
        border_size = "4";
      };
      input = {
        follow_mouse = "0";
        mouse_refocus = "false";
        accel_profile = "flat";
      };
      bind =
        [
          "$mod, Return, exec, alacritty"
          "$mod SHIFT, Return, exec, firefox"
          "$mod SHIFT, e, exec, wlogout"
	  "$mod, q, killactive"
	  "$mod, f, fullscreen"
        ]
        ++ (
          builtins.concatLists (builtins.genList (i:
              let ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        );
    };
  };
}
