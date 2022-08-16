-- shamelessly stolen from theprimeagen
-- https://github.com/ThePrimeagen/.dotfiles/blob/61784572c81d7a1973f6c0a2a4930c6739c89cc9/nvim/.config/nvim/after/plugin/keymap/init.lua
local Remap = require("fxwood.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

-- move lines/blocks up and down
-- from here: https://vim.fandom.com/wiki/Moving_lines_up_or_down
if vim.loop.os_uname().sysname == "Darwin" then
    nnoremap("<A-∆>", ":m .+1<CR>==")
    nnoremap("<A-˚>", ":m .-2<CR>==")
    inoremap("<A-∆>", "<Esc>:m .+1<CR>==gi")
    inoremap("<A-˚>", "<Esc>:m .-2<CR>==gi")
    vnoremap("<A-∆>", ":m '>+1<CR>gv=gv")
    vnoremap("<A-˚>", ":m '<-2<CR>gv=gv")
else
    nnoremap("<A-j>", ":m .+1<CR>==")
    nnoremap("<A-k>", ":m .-2<CR>==")
    inoremap("<A-j>", "<Esc>:m .+1<CR>==gi")
    inoremap("<A-k>", "<Esc>:m .-2<CR>==gi")
    vnoremap("<A-j>", ":m '>+1<CR>gv=gv")
    vnoremap("<A-k>", ":m '<-2<CR>gv=gv")
end

