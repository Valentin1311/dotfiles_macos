return {
  {
    "rgroli/other.nvim",
    config = function()
      require("other-nvim").setup({
        mappings = {
          -- Source file -> Test file
          {
            pattern = "(.*/)([^/]+)%.ts$",
            target = {
              {
                target = "%1%2.unit.test.ts",
                label = "./*.unit.test",
              },
              {
                target = "%1__tests__/**/%2.test.ts",
                label = "./__tests__/",
              },
              {
                target = "%1__tests__/**/%2/index.ts",
                label = "./__tests__/**/index.ts",
              },
              {
                target = "../__tests__/**/%2.test.ts",
                label = "../__tests__/",
              },
              {
                target = "../__tests__/**/%2/index.ts",
                label = "../__tests__/**/index.ts",
              },
              {
                target = "src/__tests__/**/%2.test.ts",
                label = "src/__tests__/",
              },
              {
                target = "src/__tests__/**/%2/index.ts",
                label = "src/__tests__/**/index.ts",
              },
            },
          },
          -- Test file -> Source file (reverse mappings)
          {
            pattern = "(.*/)([^/]+)%.unit%.test%.ts$",
            target = {
              {
                target = "%1%2.ts",
                label = "Source file",
              },
            },
          },
          {
            pattern = "(.*/)__tests__/(.*/)([^/]+)%.test%.ts$",
            target = {
              {
                target = "%1%2%3.ts",
                label = "Source file (same level)",
              },
              {
                target = "%1%3.ts",
                label = "Source file (parent)",
              },
            },
          },
          {
            pattern = "(.*/)__tests__/(.*/)([^/]+)/index%.ts$",
            target = {
              {
                target = "%1%2%3.ts",
                label = "Source file (same level)",
              },
              {
                target = "%1%3.ts",
                label = "Source file (parent)",
              },
            },
          },
        },
      })
      vim.keymap.set("n", "<leader>a", "<cmd>Other<CR>", { desc = "Alternate file" })
    end,
  },
}
