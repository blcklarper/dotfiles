--       ▪  ▄▄▌
-- ▪     ██ ██•
--  ▄█▀▄ ▐█·██▪
-- ▐█▌.▐▌▐█▌▐█▌▐▌
--  ▀█▄▀▪▀▀▀.▀▀▀
--  =====================

return {
    "stevearc/oil.nvim",

    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    lazy = false,

    config = function()
        local oil = require("oil")

        oil.setup({
            keymaps = {
                ["<CR>"] = "actions.select", -- open file or directory
                ["-"] = "actions.parent", -- go to parent directory
                ["_"] = "actions.open_cwd", -- open current working directory
                ["g."] = "actions.toggle_hidden", -- show or hide hidden files
                ["gp"] = "actions.preview", -- preview file
                ["<C-r>"] = "actions.refresh", -- refresh Oil
		["a"] = function()
		    vim.cmd("startinsert")
		end,
		["d"] = function()
		    vim.cmd("delete")
		end,
                ["q"] = "actions.close", -- close Oil
            },
        })

        vim.keymap.set("n", "e", function()
            if oil.get_current_dir() then
                oil.close()
            else
                oil.open()
            end
        end, {
            silent = true,
            desc = "Toggle Oil",
        })
    end,
}
