local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("i", "jj", "<ESC>")
map("", "<Space>", "<Nop>")

map("n", "<leader>q", "<cmd>q<CR>")
map("n", "<leader>e", ":NvimTreeToggle<cr>")

map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
