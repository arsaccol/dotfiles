vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
  pattern = ".env.*",
  command = "set syntax=sh",
})
