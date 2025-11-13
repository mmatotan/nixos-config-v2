{ config, pkgs, nixpkgs-unstable, ...}:

{
  imports = [
    ./home/neovim/default.nix
    ./home/git.nix
    ./home/alacritty.nix
    ./home/hyprlock.nix
    ./home/hyprland.nix
    ./home/hyprpaper.nix
    ./home/waybar.nix
  ];

  home.packages = with pkgs; [
    rofi
    bash
    wofi
    firefox
    ranger
    alacritty
    dunst
    rofi
    ranger
    highlight
    nodejs
    steam
  ];

  home.username = "marko";
  home.homeDirectory = "/home/marko";
  home.stateVersion = "25.05";

  home.pointerCursor = {
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    size = 32;
    hyprcursor = {
      enable = true;
      size = 32;
    };
  };

}
