require "telescope".setup {
    extensions = {
        fzf = {
            fuzzy = true,
            case_mode = "smart_case",
        },
    },
}

-- load extensions
require "telescope".load_extension "fzf"
