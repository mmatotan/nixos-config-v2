{ pkgs, ...}:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      telescope-fzf-native-nvim
      plenary-nvim
      telescope-nvim
    ];
    extraLuaConfig = /* lua */ ''
      require("telescope").setup({
        defaults = {
          layout_config = {
            horizontal = {
              width = 0.9
            }
          },
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
              ["<A-k>"] = "preview_scrolling_up",
              ["<A-j>"] = "preview_scrolling_down"
            },
            n = {
              ["<A-k>"] = "preview_scrolling_up",
              ["<A-j>"] = "preview_scrolling_down"
            }
          }
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        }
      })
      require('telescope').load_extension('fzf')
    '';
  };
}
