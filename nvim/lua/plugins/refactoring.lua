return {
  "ThePrimeagen/refactoring.nvim",
  config = function(_, opts)
    require("refactoring").setup(opts)
  end,
  keys = {
    {
      "<leader>rs",
      function()
        require("refactoring").select_refactor()
      end,
      mode = { "n", "x" },
      desc = "Refactor",
    },
  },
}
