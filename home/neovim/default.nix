let
  fromGitHub = import ../functions/fromGitHub.nix;
in

{
  imports = [
    ./ranger.nix
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    extraPackages = [
      pkgs.ripgrep
      pkgs.cargo
    ];
  };
}
