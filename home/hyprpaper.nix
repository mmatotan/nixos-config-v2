{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "${./wallpapers/building.jpeg}" ];
      wallpaper = [ ",${./wallpapers/building.jpeg}" ];
      splash = false;
      ipc = false;
    };
  };
}
