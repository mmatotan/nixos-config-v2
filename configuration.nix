{ config, pkgs, nixpkgs-unstable, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  #boot.loader.grub.enable = true;
  #boot.loader.grub.device = "/dev/vda";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Zagreb";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "hr_HR.UTF-8";
    LC_IDENTIFICATION = "hr_HR.UTF-8";
    LC_MEASUREMENT = "hr_HR.UTF-8";
    LC_MONETARY = "hr_HR.UTF-8";
    LC_NAME = "hr_HR.UTF-8";
    LC_NUMERIC = "hr_HR.UTF-8";
    LC_PAPER = "hr_HR.UTF-8";
    LC_TELEPHONE = "hr_HR.UTF-8";
    LC_TIME = "hr_HR.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.marko = {
    isNormalUser = true;
    description = "Marko Matotan";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" ];
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  environment.systemPackages = with pkgs; [
    pipewire
    wireplumber
    gcc
    gnumake
    file
    wl-clipboard
    wget
    htop
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.mononoki
  ];

  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  services.pipewire.wireplumber.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  programs.hyprland.enable = true;

  services.displayManager.ly.enable = true;

  security.sudo.enable = true;
  system.stateVersion = "25.05";

  hardware = {
    graphics = {
      enable = true;
        enable32Bit = true;
    };
    amdgpu.amdvlk = {
      enable = true;
        support32Bit.enable = true;
    };
  };
}
