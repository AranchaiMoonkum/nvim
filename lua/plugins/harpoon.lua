return {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<C-a>",
            function()
                require("harpoon.mark").add_file()
            end,
            desc = "Harpoon Add File",
        },
        {
            "<C-h>",
            function()
                require("harpoon.ui").toggle_quick_menu()
            end,
            desc = "Harpoon Menu",
        },
        {
            "<leader>ha",
            function()
                require("harpoon.ui").nav_file(1)
            end,
            desc = "Harpoon 1",
        },
        {
            "<leader>hs",
            function()
                require("harpoon.ui").nav_file(2)
            end,
            desc = "Harpoon 2",
        },
        {
            "<leader>hd",
            function()
                require("harpoon.ui").nav_file(3)
            end,
            desc = "Harpoon 3",
        },
        {
            "<leader>hf",
            function()
                require("harpoon.ui").nav_file(4)
            end,
            desc = "Harpoon 4",
        },
    },
    config = function()
        require("neocord").setup({
            logo = "auto",
            main_image = "language",
            debounce_timeout = 10,
        })
    end,
}
