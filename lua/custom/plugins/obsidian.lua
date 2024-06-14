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
    -- Optional, customize how note IDs are generated given an optional title.
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ''
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. '-' .. suffix
    end,
  },
  config = function(_, opts)
    require('obsidian').setup(opts)

    -- some keybinds for common obsidian commands
    vim.keymap.set('n', '<leader>on', '<cmd>ObsidianNew<CR>', { desc = 'Obsidian: create new note' })
    vim.keymap.set('n', '<leader>os', '<cmd>ObsidianSearch<CR>', { desc = 'Obsidian: search vault' })
    vim.keymap.set('n', '<leader>oq', '<cmd>ObsidianQuickSwitch<CR>', { desc = 'Obsidian: quick switch notes' })
    vim.keymap.set('n', '<leader>ot', '<cmd>ObsidianToday<CR>', { desc = "Obsidian: open today's daily note" })
    vim.keymap.set('n', '<leader>od', '<cmd>ObsidianDailies<CR>', { desc = 'Obsidian: open a picker with daily notes' })
    vim.keymap.set('n', '<leader>ol', '<cmd>ObsidianLinks<CR>', { desc = 'Obsidian: collect all links within buffer' })
    vim.keymap.set('n', '<leader>ob', '<cmd>ObsidianBacklinks<CR>', { desc = 'Obsidian: collect all backlinks within buffer' })
    vim.keymap.set('n', '<leader>og', '<cmd>ObsidianTags<CR>', { desc = 'Obsidian: find tags' })
    vim.keymap.set('n', '<leader>oo', '<cmd>ObsidianOpen<CR>', { desc = 'Obsidian: open note in obsidian app' })
  end,
}
