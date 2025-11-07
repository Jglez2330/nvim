vim_utils.ColorMyPencils = function(color)
	color = color or "astrotheme"
	vim.cmd.colorscheme(color)
end

ColorMyPencils = function(color)
    vim_utils.ColorMyPencils(color)
end
