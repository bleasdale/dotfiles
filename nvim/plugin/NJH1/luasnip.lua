-- luasnip.lua 
-- Luasnip config file
--
require("luasnip").config.set_config({ -- Setting LuaSnip config

  -- Enable autotriggered snippets
  enable_autosnippets = true,

  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",
})

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/luasnip/" })
require("luasnip.loaders.from_vscode").load({ paths = "~/AppData/Local/nvim-data/site/pack/packer/start/friendly-snippets/" })

