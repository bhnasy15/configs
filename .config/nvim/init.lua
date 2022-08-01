
local vim_settings = {

	["t_Co"] = "265",

	["mouse"] = "a",

	["showcmd"] = true,
	["wildmenu"] = true,
	["wildmode"] = "longest:full:lastused",
	-- ["wildignore"] = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx",

	["scrolloff"] = 10,
	["backspace"] = "indent,eol,start",

	["encoding"] = "UTF-8",
	["backup"] = false,
	["swapfile"] = false,

	["foldenable"] = false,
	["foldmethod"] = "manual",

	["shiftwidth"] = 4,
	["tabstop"] = 4,
	["smartindent"] = true,

	["hlsearch"] = false,
	["showmatch"] = true,
	["incsearch"] = true,
	["ignorecase"] = true,
	["smartcase"] = true,

	["statusline"] = "",
	["statusline"] = " %F %M %Y %R%= (%l,%c) %p%%",
	["laststatus"] = 2,

	["number"] = true,
	["relativenumber"] = true,

	["cursorline"] = true,

	["wrap"] = true,

	["spelllang"] = "ar,en",

	["netrw_banner"] = 0,
	["netrw_liststyle"] = 0,
	["netrw_keepdir"] = 0,
	["netrw_winsize"] = 45,

	["mapleader"] = ","

};

local vim_commands = {
	--"filetype on",
	--"filetype indent on",
	--"filetype plugin on",
	--"syntax on",
	"colorscheme y"
};

-- read vim_settings
for i, v in pairs(vim_settings) do
	local g = pcall(function () vim.api.nvim_set_option( i, v); end);
	local b = pcall(function () vim.api.nvim_buf_set_option( 0, i, v); end);
	if not(b) then
		local w = pcall(function () vim.api.nvim_win_set_option( 0, i, v); end);
		if not(w or b or g) then
			local v = function () vim.api.nvim_set_var( i, v); end ;
			xpcall( v, function () print("failed to set", i, "to", v) end);
		end
	end
end
-- run vim_commands
for i, v in pairs(vim_commands) do
	local c = function () vim.api.nvim_command(v); end;
	xpcall( c, function () print("failed excute command", v) end);
end

-- mappings
----------------------------------------
vim.api.nvim_set_keymap( "n", "<S-H>", "<C-W>", {});
-- explorer
vim.api.nvim_set_keymap( "n", "<leader>vo", ":Vexplore<CR>", {});
vim.api.nvim_set_keymap( "n", "<leader>ho", ":Hexplore<CR>", {});
vim.api.nvim_set_keymap( "n", "<leader>to", ":Texplore<CR>", {});
vim.api.nvim_set_keymap( "n", "<leader>o", ":e .<CR>", {});
-- write and/or quit
vim.api.nvim_set_keymap( "n", "<leader>wq", ":wq!<CR>", {});
vim.api.nvim_set_keymap( "n", "<leader>r", ":w!<CR>", {});
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
	
local opts = { noremap=true, silent=false }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities();
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities);

local lspconfig = require('lspconfig');

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
lspconfig['omnisharp'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
	cmd = {"dotnet", "/home/yarob/.opt/omnisharp-roslyn/stdio.driver/linux-x64/net6.0/OmniSharp.dll"}
}

-- luasnip setup
local luasnip = require('luasnip');

-- nvim-cmp setup
local cmp = require('cmp');
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
