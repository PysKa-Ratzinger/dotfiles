-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ===========================================================================
--
-- COMMANDS, MAPS, AND IMAPS

vim.api.nvim_create_user_command("Bclose", "bp|bd#", {})

local map = LazyVim.safe_keymap_set

local opts = { remap = false }
map("", "<F5>", "<cmd>!make -j4<CR>", opts)
map("", "<F6>", "<cmd>!make -j4 run<CR>", opts)

local opts = { remap = true }
map("i", ";hash", '<C-R>=system("head -c 16 /dev/urandom \\| xxd -p")<CR><BS>', opts)
map("i", ";guard", "<C-O>mz#ifndef %%%<CR>#define %%%<CR>#endif  // %%%<C-O>'z;;", opts)
map("i", ";struct", "<C-O>mzstruct %%% {<CR>%%%<CR><BS><BS>};<C-O>'z;;", opts)
map("i", ";main", "<C-O>mzint main (int argc, char* argv[]) {<CR>%%%<CR><BS><BS>}<C-O>'z;;", opts)
map("i", ";wh", "<C-O>mzwhile (%%%) {<CR>%%%<CR><BS><BS>}<C-O>'z;;", opts)
map("i", ";nm", "<C-O>mznamespace %%% {<CR><CR>} // namespace %%%<C-O>'z;;", opts)
map("i", ";fo", "<C-O>mzfor (%%%; %%%; %%%) {<CR>%%%<CR><BS><BS>}<C-O>'z;;", opts)
map("i", ";;", "<C-O>/%%%<CR><C-O>c3l", opts)
map("n", ";;", "/%%%<CR>c3l", opts)

map("", "<C-t><up>", "<cmd>:tabr<CR>", opts)
map("", "<C-t><down>", "<cmd>:tabl<CR>", opts)
map("", "<C-t><left>", "<cmd>:tabp<CR>", opts)
map("", "<C-t><right>", "<cmd>:tabn<CR>", opts)

map("", "<M-t>", "<cmd>:TranslateW<CR>", opts)

map("n", "<leader>gs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {})
map("n", "<leader>gS", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {})
map("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", {})
map("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {})
map("v", "<leader>K", "<cmd>lua vim.lsp.buf.hover()<CR>zz")
map("v", "<leader>=", "<cmd>lua vim.lsp.buf.format()<CR>zz")
