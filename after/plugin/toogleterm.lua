-- Set up toggleterm with your desired configuration
local toggleterm = require("toggleterm")

toggleterm.setup{
    open_mapping = [[<C-x>]],  -- Customize this key to your preference
    direction = "float",
    float_opts = {
        border = "curved",      -- You can set the border style (e.g., "single", "double", "curved")
        width = 200,             -- Set the width of the floating terminal
        height = 60,            -- Set the height of the floating terminal
        winblend = 3            -- Adjust transparency if desired
    },
    start_in_insert = true,   -- Starts in insert mode for easy command input
    shading_factor = 2,       -- Set terminal background shading
    persist_mode = true,      -- Retain terminal state across toggles
}
