return {
    "rmagatti/auto-session",
    config = function() 
        local auto_session = require("auto-session")
        auto_session.setup({
            auto_restore_enabled = false,
            auto_session_suppress_dirs = { "~/", "~/dev/", },
        })

        local keymap = vim.keymap

        keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save current session" })
        keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session" })
    end
}
