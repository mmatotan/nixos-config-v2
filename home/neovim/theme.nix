{ pkgs, ...}:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      kanagawa-nvim
    ];
    extraLuaConfig = /* lua */ ''
      require("kanagawa").setup({transparent = true})
      require("kanagawa").load("wave")
    '';
  };
}
