local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	vim.notify("没有找到 nvim-tree")
	return
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


-- 列表操作快捷键
--local list_keys = require("keybindings").nvimTreeList
local function my_on_attach(bufnr)
	local api = require "nvim-tree.api"

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	--vim.keymap.set('n', '<C-y>', api.node.open.edit, opts('提示词 g? 时显示'))
end

-- pass to setup along with your other options

nvim_tree.setup({
	-- 快捷键
	on_attach = my_on_attach,
	auto_reload_on_write = true,
	disable_netrw = false,
	hijack_cursor = false,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = false,
	sort = {
		sorter = "name",
		folders_first = true,
	},
	root_dirs = {},
	prefer_startup_root = false,
	sync_root_with_cwd = false,
	reload_on_bufenter = false,
	respect_buf_cwd = false,
	select_prompts = false,
	view = {
		centralize_selection = false,
		cursorline = true,
		debounce_delay = 15,
		width = 30,
		--hide_root_folder = false,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		float = {
			enable = false,
			quit_on_focus_loss = true,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = 30,
				height = 30,
				row = 1,
				col = 1,
			},
		},
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		highlight_git = false,
		full_name = false,
		highlight_opened_files = "none",
		highlight_modified = "none",
		root_folder_label = ":~:s?$?/..?",
		indent_width = 2,
		indent_markers = {
			enable = false,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			modified_placement = "after",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
				modified = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "󰆤",
				modified = "●",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
		symlink_destination = true,
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = false,
		update_root = false,
		ignore_list = {},
	},
	system_open = {
		cmd = "",
		args = {},
	},
	diagnostics = {
		enable = false,
		show_on_dirs = false,
		show_on_open_dirs = true,
		debounce_delay = 50,
		severity = {
			min = vim.diagnostic.severity.HINT,
			max = vim.diagnostic.severity.ERROR,
		},
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
	--	git_ignored = true,
	--	-- 隐藏隐藏文件
	--	dotfiles = true,
	--	git_clean = false,
	--	no_buffer = false,
	--	custom = {},
	--	exclude = {},
	},
	filters = {
		git_ignored = false,
		-- 隐藏隐藏文件
		dotfiles = true,
	},
	filesystem_watchers = {
		enable = true,
		debounce_delay = 50,
		ignore_dirs = {},
	},
	git = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
		disable_for_dirs = {},
		timeout = 400,
	},
	modified = {
		enable = false,
		show_on_dirs = true,
		show_on_open_dirs = true,
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false,
		},
		expand_all = {
			max_folder_discovery = 300,
			exclude = {},
		},
		file_popup = {
			open_win_config = {
				col = 1,
				row = 1,
				relative = "cursor",
				border = "shadow",
				style = "minimal",
			},
		},
		open_file = {
			quit_on_open = false,
			eject = true,
			resize_window = true,
			window_picker = {
				enable = true,
				picker = "default",
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
		remove_file = {
			close_window = true,
		},
	},
	trash = {
		cmd = "gio trash",
	},
	live_filter = {
		prefix = "[FILTER]: ",
		always_show_folders = true,
	},
	tab = {
		sync = {
			open = false,
			close = false,
			ignore = {},
		},
	},
	notify = {
		threshold = vim.log.levels.INFO,
		absolute_path = true,
	},
	ui = {
		confirm = {
			remove = true,
			trash = true,
		},
	},
	experimental = {},
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			dev = false,
			diagnostics = false,
			git = false,
			profile = false,
			watcher = false,
		},
	},
	---- 显示 git 状态图标
	--git = {
	--	enable = true,
	--},
	---- project plugin 需要这样设置
	--update_cwd = true,
	--update_focused_file = {
	--	enable = true,
	--	update_cwd = true,
	--},
	---- 隐藏 .文件 和 node_modules 文件夹
	--filters = {
	--	dotfiles = true,
	--	--dotfiles = false,
	--	--custom = { "node_modules" },
	--},
	--view = {
	--	-- 宽度
	--	--width = 40,
	--	-- 也可以 'right'
	--	side = "left",
	--	-- 隐藏根目录
	--	hide_root_folder = false,
	--	-- 自定义列表中快捷键
	--	--mappings = {
	--	--custom_only = false,
	--	--list = list_keys,
	--	--},
	--	-- 不显示行数
	--	number = false,
	--	relativenumber = false,
	--	-- 显示图标
	--	signcolumn = "yes",
	--},
	--actions = {
	--	open_file = {
	--		-- 首次打开大小适配
	--		resize_window = true,
	--		-- 打开文件时关闭
	--		quit_on_open = true,
	--	},
	--},
	---- wsl install -g wsl-open
	---- https://github.com/4U6U57/wsl-open/
	--system_open = {
	--	cmd = "open", -- mac 直接设置为 open
	--},
})
-- 自动关闭
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
