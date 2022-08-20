local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- save and quit
keymap("n", "S", ":w<CR>", opts)
keymap("n", "Q", ":q<CR>", opts)
keymap("n", "C", ":Bdelete<CR>", opts)
-- make Y to copy to end of the line
keymap("n", "Y", ":y$", opts)

-- cursor movement
keymap("n", "J", "5j", opts)
keymap("n", "K", "5k", opts)

-- map command
keymap("n", "e", ":NvimTreeToggle<CR>", opts)

keymap("n", "sk", ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", opts)
keymap("n", "sj", ":set splitbelow<CR>:split<CR>", opts)
keymap("n", "sn", ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", opts)
keymap("n", "sl", ":set splitright<CR>:vsplit<CR>", opts)
keymap("n", "srh", "<C-w>b<C-w>K", opts)
keymap("n", "srv", "<C-w>b<C-w>H", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- find : hop
keymap("n", "fw", ":HopWord<cr>", opts)
keymap("n", "fl", ":HopLine<cr>", opts)
keymap("n", "fp", ":HopPattern<cr>", opts)
keymap("n", "fc", ":HopChar1<cr>", opts)

-- find file
keymap("n", "fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", opts)
keymap("n", "ff", ":Telescope find_files<cr>", opts)
-- keymap("n", "fg", ":Telescope live_grep<cr>", opts)
keymap("n", "fb", ":Telescope buffers<cr>", opts)
keymap("n", "fs", ":Telescope lsp_workspace_symbols<cr>", opts)

-- tags
keymap("n", "T", ":AerialToggle<cr>", opts)

-- translate
keymap("n", "ts", ":TranslateW<cr>", opts)

-- format
-- keymap("n", "fm", ":Format<cr>", opts)

-- debug
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", opts)
-- keymap("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", opts)
-- keymap("n", "<leader>dl", "lua require'dap'.run_last()<cr>", opts)
-- keymap('n', '<F10>', '<cmd>lua require"user.dap.dap-util".reload_continue()<CR>', opts)
-- keymap("n", "<F4>", "<cmd>lua require'dap'.terminate()<cr>", opts)
-- keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
-- keymap("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- keymap("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- keymap("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "D", "<cmd>lua require'dapui'.eval()<cr>", opts)

-- unit test
-- keymap("n", "<leader>rr", "<cmd>UltestNearest<cr>", opts)
-- keymap("n", "<leader>rd", "<cmd>UltestDebugNearest<cr>", opts)


-- keymap("n", "<A-o>", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
-- keymap("n", "<leader>u", "<cmd>TroubleToggle lsp_references<cr>", opts)

-- calltree
-- keymap("n", "<leader>in", "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)
keymap("i", "<C-a>", "<ESC>A", opts)

-- Visual --

-- copy to system clipboard
keymap("v", "Y", '"+y', opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "J", "5j", opts)
keymap("x", "K", "5k", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- unit test
keymap("n", "rt", "<cmd>UltestNearest<cr>", opts)
keymap("n", "rd", "<cmd>UltestDebugNearest<cr>", opts)

-- sniprun
keymap("n", "rr", ":%SnipRun<cr>", opts)
keymap("v", "rs", ":%SnipRun<cr>", opts)
