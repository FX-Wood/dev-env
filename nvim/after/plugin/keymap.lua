print('loading keymaps')
-- shamelessly stolen from theprimeagen
-- https://github.com/ThePrimeagen/.dotfiles/blob/61784572c81d7a1973f6c0a2a4930c6739c89cc9/nvim/.config/nvim/after/plugin/keymap/init.lua
-- see also: https://neovim.io/doc/user/map.html#map-overview
local Remap = require("fxwood.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local noremap = Remap.noremap
local nmap = Remap.nmap
local noremap_bang = Remap.noremap_bang

-- for this to work on mac your terminal must send the right key
-- in iTerm, make the left and/or the right option key send "Esc+" in settings
-- in kitty you can make the option keys send alt directly
nnoremap("<A-j>", ":m .+1<CR>==")
nnoremap("<A-k>", ":m .-2<CR>==")
inoremap("<A-j>", "<Esc>:m .+1<CR>==gi")
inoremap("<A-k>", "<Esc>:m .-2<CR>==gi")
vnoremap("<A-j>", ":m '>+1<CR>gv=gv")
vnoremap("<A-k>", ":m '<-2<CR>gv=gv")

noremap("<up>", "<nop>")
noremap("<down>", "<nop>")
noremap("<left>", "<nop>")
noremap("<right>", "<nop>")

nnoremap("<leader>f", function()
    require('telescope.builtin').find_files()
end)
nnoremap("<leader>g", function()
    require('telescope.builtin').git_files()
end)

-- see https://vim.fandom.com/wiki/Avoid_the_escape_key
noremap("<leader><leader>", "<Esc>")
noremap_bang("<leader><leader>", "<Esc>")

