require('clipboard-image').setup {
  -- Default configuration for all filetype
  default = {
    affix = "<\n  %s\n>", -- Multi lines affix
    img_name = function ()
      vim.fn.inputsave()
      local name = vim.fn.input('Name: ')
      vim.fn.inputrestore()
      return name
    end,
    img_dir = "img",
  },
  -- You can create configuration for ceartain filetype by creating another field (markdown, in this case)
  -- If you're uncertain what to name your field to, you can run `lua print(vim.bo.filetype)`
  -- Missing options from `markdown` field will be replaced by options from `default` field
  -- markdown = {
  --   img_dir = {"src", "assets", "img"}, -- Use table for nested dir (New feature form PR #20)
  --   img_dir_txt = "/assets/img",
  --   img_handler = function(img) -- New feature from PR #22
  --     local script = string.format('./image_compressor.sh "%s"', img.path)
  --     os.execute(script)
  --   end,
  -- }
}
