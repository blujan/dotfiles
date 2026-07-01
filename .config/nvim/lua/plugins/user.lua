-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = { "amansingh-afk/milli.nvim" },
    opts = function()
      local splash = require("milli").load { module = "splashes.drift" }
      local source_opts = { hidden = true, ignored = true, exclude = { ".git", ".DS_Store" } }
      return {
        dashboard = {
          enabled = true,
          preset = {
            header = table.concat(splash.frames[1], "\n"),
          },
          sections = {
            { section = "header", padding = 1 },
            { section = "keys", gap = 1, padding = 1 },
            { section = "startup" },
          },
        },
        indent = {
          enabled = true,
        },
        picker = {
          ignored = true,
          hidden = true,
          sources = {
            files = source_opts,
            explorer = source_opts,
            grep = source_opts,
            grep_word = source_opts,
            grep_buffers = source_opts,
          },
        },
        image = {
          resolve = function(path, src)
            local api = require "obsidian.api"
            if api.path_is_note(path) then return api.resolve_attachment_path(src) end
          end,
        },
      }
    end,
    config = function(_, opts)
      require("snacks").setup(opts)
      require("milli").snacks { module = "splashes.drift", loop = true }
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = true },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })

      -- include the default astronvim config that calls the setup call
      require "astronvim.plugins.configs.luasnip"(plugin, opts)
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    "mcauley-penney/visual-whitespace.nvim",
    config = true,
  },
  {
    "mechatroner/rainbow_csv",
  },
  {
    "dlyongemallo/diffview-plus.nvim",
    version = "*",
    -- optional: lazy-load on command
    -- cmd = {
    --     "DiffviewOpen",
    --     "DiffviewToggle",
    --     "DiffviewFileHistory",
    --     "DiffviewDiffFiles",
    --     "DiffviewLog",
    -- },
  },
  -- {
  --   "esmuellert/codediff.nvim",
  --   cmd = "CodeDiff",
  -- },
}
