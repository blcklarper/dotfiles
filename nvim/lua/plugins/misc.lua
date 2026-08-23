-- • ▌ ▄ ·. ▪  .▄▄ ·  ▄▄·
-- ·██ ▐███▪██ ▐█ ▀. ▐█ ▌▪
-- ▐█ ▌▐▌▐█·▐█·▄▀▀▀█▄██ ▄▄
-- ██ ██▌▐█▌▐█▌▐█▄▪▐█▐███▌
-- ▀▀  █▪▀▀▀▀▀▀ ▀▀▀▀ ·▀▀▀
-- ===============================
return {
    { -- helps with SSH tunneling and copying to clipboard
        "ojroques/vim-oscyank",
    },

    { -- show CSS colors
        "brenoprata10/nvim-highlight-colors",
        config = function()
            require("nvim-highlight-colors").setup({})
        end,
    },
}
