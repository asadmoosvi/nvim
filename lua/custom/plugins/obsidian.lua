return {
  'epwalsh/obsidian.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'personal',
        path = '~/Dropbox/vaults/personal',
      },
    },
    daily_notes = {
      folder = 'dailies',
    },
  },
}
