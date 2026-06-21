return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- branch = "v3.x",
    -- dependencies = {
    --   "nvim-lua/plenary.nvim",
    --   "MunifTanjim/nui.nvim",
    --   -- "nvim-tree/nvim-web-devicons", -- optional, but recommended
    -- },
    -- lazy = false, -- neo-tree will lazily load itself
    opts = {
      enable_git_status = false,
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_ignored = false,
          hide_hidden = false,
          never_show = {
            ".git",
            ".DS_Store",
          },
        },
      },
      icon = {
        use_filtered_colors = false,
      },
      name = {
        use_filtered_colors = false,
        use_git_status_colors = false,
      },
    },
  },
}
