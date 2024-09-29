-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ===========================================================================
--
-- COMMANDS, MAPS, AND IMAPS

vim.api.nvim_create_user_command("Bclose", "bp|bd#", {})

local map = LazyVim.safe_keymap_set

local opts = { remap = false }
map("", "<F3>", "<cmd>!make -j4<CR>", opts)
map("", "<F4>", "<cmd>!make -j4 run<CR>", opts)

local opts = { remap = true }
map("i", ";hash", '<C-R>=system("head -c 16 /dev/urandom \\| xxd -p")<CR><BS>', opts)
