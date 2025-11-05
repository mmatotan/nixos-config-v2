{ pkgs, ...}:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      gitsigns-nvim
      vim-fugitive
    ];
    extraLuaConfig = /* lua */ ''
      require("gitsigns").setup({
        current_line_blame = true
      })
    '';
  };
}
