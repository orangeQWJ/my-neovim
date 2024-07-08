local packer = require("packer")
packer.startup({
	function(use)
		-- Packer 可以管理自己本身
		use("wbthomason/packer.nvim")
		-- 你的插件列表
		--------------------- colorschemes --------------------
		-- tokyonight
		use("folke/tokyonight.nvim")
		-- OceanicNext
		use("mhartington/oceanic-next")
		-- gruvbox
		use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
		-- nord
		use("shaunsingh/nord.nvim")
		-- onedark
		use("ful1e5/onedark.nvim")
		-------------------------------------------------------
		-- nvim-tree 侧边栏
		use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
		-- bufferline 顶栏
		--use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
		-- lualine 底部信息栏
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
		use("arkav/lualine-lsp-progress")
		-- telescope
		use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
		-- telescope 插件
		use("LinArcX/telescope-env.nvim")
		-- dashboard-nvim
		--[[use {
			'nvimdev/dashboard-nvim',
			event = 'VimEnter',
			config = function()
				require('dashboard').setup {
					-- config
				}
			end,
			requires = { 'nvim-tree/nvim-web-devicons' }
		}
		]]
		-- Telescope project插件
		use("ahmedkhalf/project.nvim")
		-- treesitter
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		-- 中文帮助文档
		use({ 'yianwillis/vimcdoc', event = 'VimEnter' })
		-- coc-nvim
		use { 'neoclide/coc.nvim', branch = 'release' }

		-- 开屏工具
		use { 'mhinz/vim-startify' }
		-- 浮动终端
		use { 'voldikss/vim-floaterm' }

		-- indent-blankline 缩进提示线
		use("lukas-reineke/indent-blankline.nvim")
		-- 飞雷神
		use('easymotion/vim-easymotion')

		--------------------- Markdown --------------------
		use("ixru/nvim-markdown")
		--use {
		--'renerocksai/telekasten.nvim',
		--requires = { 'nvim-telescope/telescope.nvim' }
		--}
		--
		-------no--use("HiPhish/nvim-ts-rainbow2")
		use("HiPhish/rainbow-delimiters.nvim")


		--ChatGPT
		use({
			"jackMort/ChatGPT.nvim",
			config = function()
				require("chatgpt").setup()
			end,
			requires = {
				"MunifTanjim/nui.nvim",
				"nvim-lua/plenary.nvim",
				"folke/trouble.nvim",
				"nvim-telescope/telescope.nvim"
			}
		})
		--use({
		--	"kdheepak/lazygit.nvim",
		--	-- optional for floating window border decoration
		--	requires = {
		--		"nvim-lua/plenary.nvim",
		--	},
		--})
		use("lewis6991/gitsigns.nvim")

		--------------------- LSP --------------------
		-- 用于方便安装各类语言LSP服务端
		--use("williamboman/nvim-lsp-installer")
		-- Lspconfig 提供了一堆常用服务的配置
		--use({ "neovim/nvim-lspconfig" })
		-- 补全引擎
		--use("hrsh7th/nvim-cmp")
		-- snippet 引擎
		--use("hrsh7th/vim-vsnip")
		-- 补全源
		--use("hrsh7th/cmp-vsnip")
		--use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
		--use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
		--use("hrsh7th/cmp-path") -- { name = 'path' }
		--use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
		--
		-- 常见编程语言代码段
		--use("rafamadriz/friendly-snippets")
		-- 补全图标
		--use("onsails/lspkind-nvim")
		-- indent-blankline
		--use("lukas-reineke/indent-blankline.nvim")
		-- 格式化
		-- use("mhartington/formatter.nvim")
		--use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

		-- 括号匹配
		--use("jiangmiao/auto-pairs")
		-- 符号对齐
		--use("junegunn/vim-easy-align")
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})

---- 每次保存 plugins.lua 自动安装插件
--pcall(
--	vim.cmd,
--	[[
--	augroup packer_user_config
--	autocmd!
--	autocmd BufWritePost plugins.lua source <afile> | PackerSync
--	augroup end
--  ]]
--)
