return {{
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
        require "jglez2330.config.telescope.telescope"
	end,
},
{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
{'debugloop/telescope-undo.nvim', dependencies = {
    {
          "nvim-telescope/telescope.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            },
          },},
    config = function()
        require "jglez2330.config.telescope.undo"
    end,
}
