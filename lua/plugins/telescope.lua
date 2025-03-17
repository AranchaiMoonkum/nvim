return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
        },
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
    },
    config = function()
        local TS = require("telescope")

        local defaults = {
            multi_icon = "",
            entry_prefix = "   ",
            prompt_prefix = "   ",
            selection_caret = "  ",
        }

        local pickers = {
            colorscheme = {
                enable_preview = true,
            }
        }

        local extensions = {
            fzf = {
                fuzzy = true,
                case_mode = "smart_case",
            },
        }

        TS.setup({
            defaults = defaults,
            pickers = pickers,
            extensions = extensions,
        })

        TS.load_extension("fzf")
    end,
}
