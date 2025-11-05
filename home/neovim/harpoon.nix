{ pkgs, nixpkgs-unstable, ... }:
{
  programs.neovim = {
    plugins = with nixpkgs-unstable.vimPlugins; [
      harpoon2
    ];
    extraLuaConfig = /* lua */ ''
      require("harpoon").setup({})

      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
              results = file_paths,
            }),
            previewer = require("telescope.config").values.file_previewer({}),
            sorter = require("telescope.config").values.generic_sorter({}),
          })
          :find()
      end
    '';
  };
}

