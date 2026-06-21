return {
  "obsidian-nvim/obsidian.nvim",
  -- the obsidian vault in this default config  ~/obsidian-vault
  -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
  -- event = { "bufreadpre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
  event = {
      "BufReadPre " .. vim.fn.expand "~" .. "/Sync/Desk/*.md",
      "BufReadPre " .. vim.fn.expand "~" .. "/Sync/Planner/*.md",
      "BufReadPre " .. vim.fn.expand "~" .. "/Sync/Exercises/*.md",
      "BufReadPre " .. vim.fn.expand "~" .. "/Documents/TestVault/Test/*.md",
      "BufReadPre " .. vim.fn.expand "~" .. "/Sync/Projects/Family Doc Project Notes/*.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "hrsh7th/nvim-cmp", optional = true },
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["gf"] = {
              function()
                if require("obsidian").util.cursor_on_markdown_link() then
                  return "<Cmd>Obsidian follow_link<CR>"
                else
                  return "gf"
                end
              end,
              desc = "Obsidian Follow Link",
            },
          },
        },
        options = {
          opt = {
            conceallevel = 2,
            wrap = true,
            breakindentopt="list:-1",
          },
        },
      },
    },
  },
  opts = function(_, opts)
    local astrocore = require "astrocore"
    return astrocore.extend_tbl(opts, {
      legacy_commands = false,
      workspaces = {
        {
          name = "Desk",
          path = "~/Sync/Desk",
        },
        {
          name = "Planner",
          path = "~/Sync/Planner",
        },
        {
          name = "Exercises",
          path = "~/Sync/Exercises",
        },
        {
          name = "Test",
          path = "~/Documents/TestVault/Test",
        },
        {
          name = "Family Doc Project Notes",
          path = "~/Sync/Projects/Family Doc Project Notes",
        },
      },
      open = {
        use_advanced_uri = true,
      },
      finder = (astrocore.is_available "snacks.pick" and "snacks.pick")
        or (astrocore.is_available "telescope.nvim" and "telescope.nvim")
        or (astrocore.is_available "fzf-lua" and "fzf-lua")
        or (astrocore.is_available "mini.pick" and "mini.pick"),

      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
      },
      daily_notes = {
        folder = "daily",
      },
      -- ui = {
      --   ignore_conceal_warn = true,
      -- }
      -- note_frontmatter_func = function(note)
      --   -- This is equivalent to the default frontmatter function.
      --   local out = { id = note.id, aliases = note.aliases, tags = note.tags }
      --   -- `note.metadata` contains any manually added fields in the frontmatter.
      --   -- So here we just make sure those fields are kept in the frontmatter.
      --   if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      --     for k, v in pairs(note.metadata) do
      --       out[k] = v
      --     end
      --   end
      --   return out
      -- end,
      --
      -- -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
      -- -- URL it will be ignored but you can customize this behavior here.
      -- follow_url_func = vim.ui.open,
    })
  end,
}
