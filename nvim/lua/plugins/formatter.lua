return {
	"stevearc/conform.nvim",
	cmd = { "ConformInfo" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format" },
				go = { "gofmt" },
				terraform = { "terraform_fmt" },
				yaml = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
				sh = { "shfmt" },
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "Format buffer" })
	end,
}
