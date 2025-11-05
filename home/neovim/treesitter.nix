{ pkgs, ...}:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
    ];
    extraLuaConfig = /* lua */ ''
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = false
      })
    '';
  };
}
