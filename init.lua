vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = "<Space>"


require("config.lazy")

require("catppuccin").setup()
vim.cmd.colorscheme = "catppuccin"

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left<CR>")

local configs = require("nvim-treesitter.configs")

configs.setup({
	auto_install = "true",
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "vue", "rust" },
	highlight = { enable = true },
	indent = { enable = true },
})

