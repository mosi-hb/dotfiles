-- This is a file finder, i replaced this with NvimTree

return {
  {
    'nvim-telescope/telescope.nvim', version = '*',
	    dependencies = {
        	'nvim-lua/plenary.nvim',
        	-- optional but recommended
        	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    	}
	},
}
