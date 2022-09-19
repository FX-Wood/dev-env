-- shamelessly stolen from the primeagen
-- https://github.com/ThePrimeagen/.dotfiles/blob/61784572c81d7a1973f6c0a2a4930c6739c89cc9/nvim/.config/nvim/lua/theprimeagen/keymap.lua
local M = {}

local function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

M.nmap = bind("n", {noremap = false})
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")
M.noremap = bind("")
M.noremap_bang = bind("!")

return M
