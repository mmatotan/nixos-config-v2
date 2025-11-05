{
  programs.neovim = {
    extraLuaConfig = /* lua */ ''
      local opts = { noremap = true, silent = true }

      local term_opts = { silent = true }
      
      -- Shorten function name
      local keymap = vim.keymap.set
      
      --Remap space as leader key
      keymap("", "<Space>", "<Nop>", opts)
      vim.g.mapleader = " "
      vim.g.maplocalleader = " "
      
      -- Modes
      --   normal_mode = "n",
      --   insert_mode = "i",
      --   visual_mode = "v",
      --   visual_block_mode = "x",
      --   term_mode = "t",
      --   command_mode = "c",
      
      -- Normal --
      -- Better window navigation
      keymap("n", "<C-h>", "<C-w>h", opts)
      keymap("n", "<C-j>", "<C-w>j", opts)
      keymap("n", "<C-k>", "<C-w>k", opts)
      keymap("n", "<C-l>", "<C-w>l", opts)
      
      -- Resize with arrows
      keymap("n", "<C-Up>", ":resize -2<CR>", opts)
      keymap("n", "<C-Down>", ":resize +2<CR>", opts)
      keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
      keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
      
      -- Navigate buffers
      keymap("n", "<S-l>", ":bnext<CR>", opts)
      keymap("n", "<S-h>", ":bprevious<CR>", opts)
      keymap("n", "<S-x>", ":bd<CR>", opts)
      
      -- Insert --
      -- Press jj fast to enter
      keymap("i", "jj", "<ESC>", opts)
      
      -- Move text up and down
      keymap("v", "<A-j>", ":m .+1<CR>==", opts)
      keymap("v", "<A-k>", ":m .-2<CR>==", opts)
      keymap("v", "p", '"_dP', opts)
      
      -- Visual Block --
      -- Move text up and down
      keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
      keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
      keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
      keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
      
      -- Terminal --
      -- Better terminal navigation
      keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
      keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
      keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
      keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
      
      -- LSP --
      keymap('n', 'gd', vim.lsp.buf.definition, opts)
      keymap('n', 'gh', vim.lsp.buf.hover, opts)
      keymap('n', 'gr', vim.lsp.buf.references, opts)
      keymap('n', '<leader>d', vim.diagnostic.open_float, opts)

      -- Ranger --
      keymap("n", "<leader>e", "", {
        noremap = true,
        callback = function()
          require("ranger-nvim").open(true)
        end
      })

      -- Init new empty file --
      keymap("n", "<leader>n", ":enew<CR>", opts)

      -- Telescope --
      local telescope_builtin = require('telescope.builtin')
      keymap('n', '<leader>f', telescope_builtin.find_files, opts)
      keymap('n', '<leader>F', telescope_builtin.live_grep, opts)
      keymap('n', '<leader>r', telescope_builtin.resume, opts)
      keymap('n', '<leader><Tab>', telescope_builtin.buffers, opts)

      -- Gitsigns --
      keymap("n", "<leader>gb", ":Gitsigns blame<CR>", opts)

      -- Harpoon --
      local harpoon = require("harpoon")
      keymap("n", "<leader><leader>", function()
        toggle_telescope(harpoon:list())
      end, { desc = "Open harpoon window" })

      keymap("n", "<A-a>", function() harpoon:list():add() end)
      keymap("n", "<A-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
      keymap("n", "<A-1>", function() harpoon:list():select(1) end)
      keymap("n", "<A-2>", function() harpoon:list():select(2) end)
      keymap("n", "<A-3>", function() harpoon:list():select(3) end)
      keymap("n", "<A-4>", function() harpoon:list():select(4) end)
      keymap("n", "<A-5>", function() harpoon:list():select(5) end)
      keymap("n", "<A-6>", function() harpoon:list():select(6) end)
      keymap("n", "<A-7>", function() harpoon:list():select(7) end)
      keymap("n", "<A-8>", function() harpoon:list():select(8) end)
      keymap("n", "<A-9>", function() harpoon:list():select(9) end)
    '';
  };
}
