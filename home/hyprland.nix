{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      env = [
      	"HYPRCURSOR_THEME,phinger-cursors-dark"
      	"HYPRCURSOR_SIZE,24"
      	"XCURSOR_THEME,phinger-cursors-dark"
      	"XCURSOR_SIZE,24"
      ];

      "$mod" = "SUPER";
      exec-once = [
        "waybar"
      ];
      exec = "hyprpaper";

      monitor = "main, 1920x1080@60.00HHz, 0x0, 1";
      decoration = {
        blur = {
          size = 1;
        };
        rounding = "2";
        inactive_opacity = "0.6";
      };
      general = {
        gaps_in = "8";
        gaps_out = "16";
        border_size = "2";
        "col.active_border" = "0xc8c093ee";
        "col.inactive_border" = "0xee2d4f67";
      };
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
      input = {
        follow_mouse = "0";
        mouse_refocus = "false";
        accel_profile = "flat";
        repeat_delay = 300;
        repeat_rate = 50;
      };
      bind =
        [
          "$mod, Return, exec, alacritty"
          "$mod SHIFT, Return, exec, firefox"
          "$mod SHIFT, e, exec, hyprlock"
	        "$mod, q, killactive"
	        "$mod, f, fullscreen"
          "$mod, h, movefocus, l"
          "$mod, l, movefocus, r"
          "$mod, k, movefocus, u"
          "$mod, j, movefocus, d"
          "$mod SHIFT, h, movewindow, l"
          "$mod SHIFT, l, movewindow, r"
          "$mod SHIFT, k, movewindow, u"
          "$mod SHIFT, j, movewindow, d"
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
