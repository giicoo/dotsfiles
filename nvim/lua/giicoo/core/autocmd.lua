local fixBufferLineSeparator = function()
  vim.api.nvim_set_hl(0, "BufferLineOffsetSeparator", vim.api.nvim_get_hl_by_name('NvimTreeWinSeparator', true))   
end

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = fixBufferLineSeparator,
})


