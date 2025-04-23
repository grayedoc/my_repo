-- =============================
-- 1. Cấu hình cơ bản
-- =============================
vim.opt.syntax = "enable"
vim.opt.compatible = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.cursorline = false
vim.opt.clipboard = "unnamedplus"
vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.showtabline = 2
vim.opt.guicursor = "i:ver100"
vim.opt.laststatus = 2

vim.opt.guifont = "FiraCode Nerd Font:h9"

-- =============================
-- 2. Plugin Manager: lazy.nvim
-- =============================
require("lazy").setup({
  { "neoclide/coc.nvim", branch = "release" },
  { "tpope/vim-fugitive" },
  { "shaunsingh/solarized.nvim" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "folke/which-key.nvim" },
  { "preservim/nerdtree" },
  { "nvim-tree/nvim-web-devicons" },
  { "ryanoasis/vim-devicons" },
  { "junegunn/fzf", build = function() vim.fn["fzf#install"]() end },
  { "junegunn/fzf.vim" },
  { "voldikss/vim-floaterm" },
  {
      "nvim-lualine/lualine.nvim",
       dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
})

-- =============================
-- 3. Cấu hình giao diện
-- =============================
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.synmaxcol = 3000
vim.opt.background = "light"

-- =============================
-- 4. NERDTree
-- =============================
vim.keymap.set("n", "<C-n>", ":NERDTreeToggle<CR>")
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeQuitOnOpen = 1

-- =============================
-- 5. Màu và font
-- =============================
vim.cmd [[
  syntax match cppFunction /\v\w+\s*(.*)\s*\{/
  highlight cppFunction ctermfg=blue guifg=#0000FF
  colorscheme solarized
  hi Normal ctermbg=none guibg=none
  hi NormalNC ctermbg=none guibg=none
  hi NormalFloat ctermbg=none guibg=none
  hi EndOfBuffer ctermbg=none guibg=none
]]

vim.g.solarized_italic_comments = true
vim.g.solarized_italic_keywords = true
vim.g.solarized_italic_functions = true
vim.g.solarized_italic_variables = false
vim.g.solarized_contrast = true
vim.g.solarized_borders = false
vim.g.solarized_disable_background = false

-- =============================
-- 6. Phím tắt hữu ích
-- =============================
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<C-h>", ":nohl<CR>")
vim.keymap.set("n", "<C-p>", ":Files<CR>")
vim.keymap.set("n", "<leader>d", ":CocDiagnostics<CR>", { silent = true })
vim.keymap.set("n", "<leader>D", ":CocCommand diagnostics.show<CR>", { silent = true })
vim.keymap.set("n", "[d", "<Plug>(coc-diagnostic-prev)", { silent = true })
vim.keymap.set("n", "]d", "<Plug>(coc-diagnostic-next)", { silent = true })
vim.keymap.set("n", "<leader>s", ":w<CR>")
vim.keymap.set("n", "<leader>c", ":%y+<CR>")
vim.keymap.set("n", "<leader>wq", ":wq<CR>")
vim.keymap.set("n", "<leader>qi", ":q!<CR>")
vim.keymap.set("n", "<leader>bd", ":bp | sp | bn | bd<CR>", { silent = true })
vim.api.nvim_set_keymap('i', '<TAB>', [[coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()]], { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<CR>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], { noremap = true, silent = true, expr = true })

-- =============================
-- 7. Floaterm
-- =============================
vim.g.floaterm_position = "topright"
vim.g.floaterm_shell = "bash.exe"
vim.keymap.set("n", "<leader>f", ":FloatermNew<CR>", { silent = true })
vim.keymap.set("t", "<leader>q", [[<C-\><C-n>:FloatermKill<CR>]], { silent = true })
vim.keymap.set("n", "<C-g>", ":FloatermToggle<CR>", { silent = true })
vim.keymap.set("t", "<C-g>", [[<C-\><C-n>:FloatermToggle<CR>]], { silent = true })
vim.keymap.set("n", "<C-j>", ":FloatermNext<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":FloatermPrev<CR>", { silent = true })

-- =============================
-- 8. Treesitter
-- =============================
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "cpp" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- =============================
-- 9. which-key
-- =============================
require("which-key").setup {}

-- =============================
-- 10. Python path cho Coc
-- =============================
vim.g.python3_host_prog = "C:/Users/Admin/AppData/Local/Programs/Python/Python313/python.exe"


-- lualine config 
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'solarized',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename', 'filetype'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {'filetype'},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {'filetype'}
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
