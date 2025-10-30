{ pkgs, ...}:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      (fromGitHub "HEAD" "kelly-lin/ranger.nvim")
    ];
    extraLuaConfig = /* lua */ ''
      require("ranger-nvim").setup({
        replace_netrw = true;
	io = {
	  border = "rounded",
	  height = 0.75,
	  width = 0.75
	}
      })
        vim.keymap.set("n", "<leader>e", "", {
          noremap = true,
          callback = function()
            require("ranger-nvim").open(true)
          end
        })
      end
    '';
  };
}
