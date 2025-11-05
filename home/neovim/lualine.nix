{ pkgs, ...}:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      lualine-nvim
      nvim-web-devicons
    ];
    extraLuaConfig = /* lua */ ''
      require("lualine").setup()
    '';
  };
}
