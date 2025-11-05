{
  programs.hyprlock = {
    enable = true;
    settings = {
      input-field = [
        {
          size = "300, 40";
          position = "0, -200";
          monitor = "";
          placeholder_text = "";
          dots_center = true;
          dots_size = 0.2;
          dots_spacing = 0.2;
          fade_on_empty = false;
          font_color = "rgb(197, 201, 199)";
          inner_color = "rgba(164, 167, 164, 0.5)";
          outer_color = "rgba(20, 23, 29, 0)";
          outline_thickness = 2;
          shadow_passes = 2;
          hide_input = false;
          halign = "center";
          valign = "center";
          font_family = "Mononoki Nerd Font Mono";
        }
      ];
      background = [
        {
          path = "${./wallpapers/stup.jpeg}";
          blur_passes = 0;
          blur_size = 0;
        }
      ];
      label = [
        {
          monitor = "";
          text = "cmd[update:1000] echo -e \"$(date +\"%H\")\"";
          color = "rgba(101, 133, 148, 1)";
          font_family = "Mononoki Nerd Font Mono";
          font_size = 140;
          position = "0, 240";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "cmd[update:1000] echo -e \"$(date +\"%M\")\"";
          color = "rgba(197, 201, 199, 1)";
          font_family = "Mononoki Nerd Font Mono";
          font_size = 140;
          position = "0, 75";
          halign = "center";
          valign = "center";
         }
        {
          monitor = "";
          text = "cmd[update:1000] echo \"<span color='##c5c9c700'>$(date '+%A, ')</span><span color='##65859400'>$(date '+%d %B')</span>\"";
          font_size = 30;
          font_family = "Mononoki Nerd Font Mono";
          position = "0, -80";
          halign = "center";
          valign = "center";
        }
      ];
      general = {
        no_fade_in = false;
        no_fade_out = false;
        hide_cursor = false;
        grace = 0;
        disable_loading_bar = true;
      };
    };
  };
}
