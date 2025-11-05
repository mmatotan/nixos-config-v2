{ pkgs, ...}:

let
  fromGitHub = import ../functions/fromGitHub.nix;
in

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      (fromGitHub { inherit pkgs; rev="fd2cc999f3ef88f7cdcbcad5f26000c52b16c489"; ref="main"; user="kelly-lin"; repo="ranger.nvim"; })
    ];
    extraLuaConfig = /* lua */ ''
      require("ranger-nvim").setup({
        replace_netrw = true;
	      ui = {
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
    '';
  };
}
