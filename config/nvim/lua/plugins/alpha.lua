return {
    "goolord/alpha-nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local startify = require("alpha.themes.startify")
        -- available: devicons, mini, default is mini
        -- if provider not loaded and enabled is true, it will try to use another provider
        startify.file_icons.provider = "devicons"
        -- Hornet ASCII Art goes here
        startify.section.header.val = {
            "             /|",
            "            / |",
            "           /  |",
            "          /   |",
            "         /`--' \\",
            "        /  O O  \\",
            "       |    ^    |     <- This is hornet from hollow knight",
            "        \\ ----- /",
            "         |  |  |             Made by Gemini Pro",
            "         |  |  |",
            "        /   |   \\",
            "       '----'----'",
        }

        require("alpha").setup(
            startify.config
        )
    end,
}
