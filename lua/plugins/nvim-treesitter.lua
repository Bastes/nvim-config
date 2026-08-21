return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    -- A list of parser names to keep installed
    local ensure_installed = {
      "c", "lua", "vim", "vimdoc", "query", "elixir", "comment",
      "javascript", "ruby", "haskell", "elm", "html", "markdown", "markdown_inline",
    }

    require('nvim-treesitter').setup()
    require('nvim-treesitter').install(ensure_installed)

    local max_filesize = 1024 * 1024 -- 1 MB

    -- Enable highlighting for every filetype with an installed parser
    -- (equivalent of the old `highlight.enable = true`, skipping large files)
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(ev)
        local lang = vim.treesitter.language.get_lang(ev.match)
        if not lang or not vim.tbl_contains(ensure_installed, lang) then
          return
        end

        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(ev.buf))
        if ok and stats and stats.size > max_filesize then
          return
        end

        vim.treesitter.start(ev.buf, lang)
        vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "html",
      callback = function()
        vim.bo.shiftwidth = 2
        vim.bo.tabstop = 2
        vim.bo.softtabstop = 2
        vim.bo.expandtab = true
      end,
    })

    -- Toggle conceallevel between 0 and 2
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        vim.keymap.set("n", "<leader>lc", function()
          local current = vim.wo.conceallevel
          local new = (current == 0) and 2 or 0
          vim.wo.conceallevel = new
        end, { silent = true, desc = "Toggle conceallevel" })
      end,
    })
  end
}
