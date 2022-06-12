-----------------------------------------------------------------------------------
vim.api.nvim_command("colorscheme y");

vim.api.nvim_set_option("t_Co", "265");

vim.api.nvim_set_option("mouse", "a");

vim.api.nvim_set_option("showcmd", true);
vim.api.nvim_set_option("wildmenu", true);
vim.api.nvim_set_option("wildmode", "longest:full:lastused");
-- vim.api.nvim_set_option("wildignore", "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx");

vim.api.nvim_set_option("scrolloff", 10);
vim.api.nvim_set_option("backspace", "indent,eol,start");

vim.api.nvim_set_option("encoding", "UTF-8");
vim.api.nvim_set_option("backup", false);
vim.api.nvim_set_option("swapfile", false);

vim.api.nvim_set_option("shiftwidth", 4);
vim.api.nvim_set_option("tabstop", 4);
vim.api.nvim_set_option("smartindent", true);

vim.api.nvim_set_option("hlsearch", false);
vim.api.nvim_set_option("showmatch", true);
vim.api.nvim_set_option("incsearch", true);
vim.api.nvim_set_option("ignorecase", true);
vim.api.nvim_set_option("smartcase", true);

vim.api.nvim_set_option("statusline", "");
vim.api.nvim_set_option("statusline", " %F %M %Y %R%= (%l,%c) %p%%");
vim.api.nvim_set_option("laststatus", 2);

vim.api.nvim_set_option( "number", true);
vim.api.nvim_set_option( "relativenumber", true);
vim.api.nvim_win_set_option( 0, "number", true);
vim.api.nvim_win_set_option( 0, "relativenumber", true);

vim.api.nvim_set_option( "cursorline", true);
vim.api.nvim_win_set_option( 0, "cursorline", true);

vim.api.nvim_set_option( "wrap", true);
vim.api.nvim_win_set_option( 0, "wrap", true);

vim.api.nvim_set_option("spelllang", "ar,en");
vim.api.nvim_buf_set_option(0, "spelllang", "ar,en");

-- file browser/explorer (netrw) settings
vim.api.nvim_set_var("netrw_banner", 0);
vim.api.nvim_set_var("netrw_liststyle", 3);
vim.api.nvim_set_var("netrw_winsize", 45);

-----------------------------------------------------------------------------------
vim.api.nvim_set_var( "mapleader", ",");
----------------------------------------
vim.api.nvim_set_keymap( "n", "<S-H>", "<C-W>", {});
-- explorer
vim.api.nvim_set_keymap( "n", "<leader>vo", ":Vexplore<CR>", {});
vim.api.nvim_set_keymap( "n", "<leader>ho", ":Hexplore<CR>", {});
-- write and/or quit
vim.api.nvim_set_keymap( "n", "<leader>wq", ":wq!<CR>", {});
vim.api.nvim_set_keymap( "n", "<leader>q", ":q!<CR>", {});
-- language
vim.api.nvim_set_keymap( "n", "<leader>a", ":set arabic!<CR>", {});
vim.api.nvim_set_keymap( "n", "<leader>sp", ":set spell!<CR>", {});
-- clipboard
vim.api.nvim_set_keymap( "n", "<leader>y", "\"+y", {});
vim.api.nvim_set_keymap( "n", "<leader>p", "\"+p", {});
vim.api.nvim_set_keymap( "n", "<leader>P", ":r! xclip -selection clipboard -o<CR>", {});
-- complete braces
vim.api.nvim_set_keymap( "i", "{<CR>", "{<CR>}<ESC>O", {});
-----------------------------------------------------------------------------------

require('orgmode').setup_ts_grammar();

require'nvim-treesitter.configs'.setup {
-- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
	highlight = {
	  enable = true,
	  additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
	},
	ensure_installed = {'org'} -- Or run :TSUpdate org
};

require('orgmode').setup({
	org_agenda_files = {'~/Orgs/org/*', '~/my-orgs/**/*'},
	org_default_notes_file = '~/Orgs/org/refile.org',
});

-- set by default
-- vim.api.nvim_command("filetype on");
-- vim.api.nvim_command("filetype indent on");
-- vim.api.nvim_command("filetype plugin on");
-- vim.api.nvim_command("syntax on");

