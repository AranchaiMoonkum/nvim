return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
        suggestion = {
            auto_trigger = true,
            keymap = {
                accept = "<C-e>",
                dismiss = "<C-c>"
            }
        },
        copilot_model = "gpt-4o-copilot",
    },
}
