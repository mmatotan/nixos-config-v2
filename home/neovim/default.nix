{ pkgs, nixpkgs-unstable, ... }:

let
  fromGitHub = import ../functions/fromGitHub.nix;
in

{
  imports = [
    ./keymaps.nix
    ./options.nix
    ./ranger.nix
    ./telescope.nix
    ./treesitter.nix
    ./git.nix
    ./lualine.nix
    ./lsp.nix
    ./harpoon.nix
    ./theme.nix
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    extraPackages = [
      pkgs.ripgrep
      pkgs.cargo
      pkgs.nil
    ];
    plugins = with pkgs.vimPlugins; [
    ];
  };
}
