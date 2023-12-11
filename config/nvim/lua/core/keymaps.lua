-- Aliases --
local key = vim.api.nvim_set_keymap
local dopts = { noremap = true, silent = true }
-- Remap default keys
key("", "<up>", "nop", dopts)
key("", "<down>", "nop", dopts)
key("", "<left>", "nop", dopts)
key("", "<right>", "nop", dopts)

key("i", "<up>", "nop", dopts)
key("i", "<down>", "nop", dopts)
key("i", "<left>", "nop", dopts)
key("i", "<right>", "nop", dopts)

key("i", "<C-k>", "<up>", dopts)
key("i", "<C-j>", "<down>", dopts)
key("i", "<C-h>", "<left>", dopts)
key("i", "<C-l>", "<right>", dopts)

-- Better escape
key("t", "jk", "<C-\\><C-n>", dopts)

-- Finish highlight
key("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", dopts)

-- Windows keys
key("n", "e", ":vertical split ", dopts)
key("n", "<S-h>", ":vertical resize +1<CR>", dopts)
key("n", "<S-l>", ":vertical resize -1<CR>", dopts)
key("n", "<S-j>", ":resize -1<CR>", dopts)
key("n", "<S-k>", ":resize +1<CR>", dopts)

-- Bufferkeys
key("n", "<Tab-h>", ":BufflinePrev<CR>", dopts)
key("n", "<Tab-l>", ":BufflineNext<CR>", dopts)

-- Open Terminal
key("n", "t", ":ToggleTerm<CR>", dopts)

-- Savefiles
key("n", "s", ":w<CR>", dopts)
key("n", "z", ":q<CR>", dopts)

-- NvimTree
key("n", "f", ":NvimTreeFocus<CR>", dopts)

-- Bufferline
key("n", "bn", ":BufflineNext<CR>", dopts)
key("n", "bv", ":BufflinePrev<CR>", dopts)
